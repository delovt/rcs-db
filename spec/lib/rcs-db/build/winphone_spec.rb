require 'spec_helper'
require 'fileutils'

require_db 'db_layer'
require_db 'grid'
require_db 'build'
require_db 'core'

require_relative 'shared'

module RCS::DB
  describe BuildWinPhone, build: true do

    shared_spec_for(:winphone)

    before(:all) do
      RCS::DB::Config.instance.load_from_file
    end

    describe 'Windows Phone builder' do
      it 'should create the silent installer' do
        params = {
          'factory' => {'_id' => @factory.id},
          'binary'  => {'demo' => false},
          'melt'    => {},
          'package' => {}
        }

        subject.create(params)

        subject.outputs.each do |name|
          path = subject.path(name)
          size = File.size(path)
          expect(size).not_to eql(0)
        end
      end

      it 'should create the melted installer' do
        pending
      end
    end
  end
end
