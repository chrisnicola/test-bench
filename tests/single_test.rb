require_relative './test_init'

context 'Running a single test by line number' do
  context 'Choose a test by line number', line_number: 9 do
    test "Will not call this test" do
      refute true
    end

    test "Will call this test" do
      assert true
    end
  end

  context 'Choose a test by number...', line_number: 20 do
    context '...in a nested context' do
      test "Will not call this test" do
        refute true
      end

      test "Will call this test" do
        assert true
      end
    end
  end
end
