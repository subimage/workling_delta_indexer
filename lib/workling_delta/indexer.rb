module WorklingDelta
  # This is the class that that should be wired to your index configuration
  # @example definition in an index
  #   define_index do |index|
  #     set_property :delta => WorklingDelta::Indexer
  #   end
  class Indexer < ThinkingSphinx::Deltas::DefaultDelta
    # Creates the worker that performs the delta indexing
    # @param model the class of that triggered the delta
    # @param instance the instance that changed (if applicable)
    # @return [Boolean] should always return true
    def index(model, instance = nil)
      doc_id = instance ? instance.sphinx_document_id : nil
      Rails.logger.info "WorklingDelta - index"
      Rails.logger.info "model: #{model} | doc_id: #{doc_id}"
      WorklingDelta::Worker.asynch_index({
        :index_name => model.delta_index_names, 
        :document_id => doc_id
      })
      Rails.logger.info "WorklingDelta - enqueued async_index"
      return true
    end
  end
end
