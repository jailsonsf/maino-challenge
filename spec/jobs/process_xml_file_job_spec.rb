require 'rails_helper'

RSpec.describe ProcessXmlFileJob, type: :job do
  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      ProcessXmlFileJob.perform_later
    }.to have_enqueued_job(ProcessXmlFileJob)
  end
end
