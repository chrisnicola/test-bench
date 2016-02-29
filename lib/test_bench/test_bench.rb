module TestBench
  def self.activate
    # "Monkeypatch" assert, context, and test onto the main object
    TOPLEVEL_BINDING.receiver.extend Structure

    # Build the output instance that will be used to render all the test output
    output = Output.build

    # Settings can affect the output (verbosity & color), so we pass the output
    # object into the toplevel settings object.
    settings = Settings::Registry.get TOPLEVEL_BINDING
    settings.output = output

    # Telemetry pushes updates to output for display, and output reads telemetry
    # for summary data (e.g. tests per second, number of failures, etc.)
    telemetry = Telemetry::Registry.get TOPLEVEL_BINDING
    telemetry.add_observer output
    output.telemetry = telemetry
  end
end
