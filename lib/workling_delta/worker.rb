require 'thinking_sphinx'
require 'thinking_sphinx/deltas/delayed_delta/delta_job'
require 'thinking_sphinx/deltas/delayed_delta/flag_as_deleted_job'

# The Worker that actually performs the delta indexing
# This class performs the indexing asyncronously for Workling configurations
class WorklingDelta::Worker < Workling::Base
  #perform the index
  #@option options [String] :index_name the name of the index to run the delta job on
  #@option options [Integer, nil] :document_id the sphinx document id of the object that needs to be flagged as deleted
  def index(options = {})
    Rails.logger.info "WorklingDelta::Worker - index"
    Rails.logger.info "WorklingDelta::Worker OPTIONS: #{options.inspect}"
    ThinkingSphinx::Deltas::DeltaJob.new(options[:index_name]).perform
    Rails.logger.info "WorklingDelta::Worker - performed DeltaJob.new"
    if options[:document_id]
      ThinkingSphinx::Deltas::FlagAsDeletedJob.new(options[:index_name], 
        options[:document_id]).perform
    end
  end
end
