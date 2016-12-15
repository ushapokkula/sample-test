require_relative '../../sample_test/pages/sample_test'


module TestWorld

  def sample_test
    @sample_test ||= SampleTest.new
  end


end