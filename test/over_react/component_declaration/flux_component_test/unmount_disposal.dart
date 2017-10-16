part of over_react.component_declaration.flux_component_test;

@Factory()
UiFactory<TestStoreHandlersProps> UnmountDisposal;

@Props()
class UnmountDisposalProps extends FluxUiProps<TestActions, TestStore> {}

@Component()
class UnmountDisposalComponent extends FluxUiComponent<UnmountDisposalProps> {
  int numberOfEvents = 0;

  StreamController<String> _controller;

  @override
  componentWillMount() {
    super.componentWillMount();

    _controller = new StreamController<String>.broadcast(sync: true);
    manageStreamController(_controller);

    listenToStream(_controller.stream, _onStreamEvent);
  }

  @override
  render() => Dom.div()();

  sendEvent() {
    _controller.add('Event');
  }

  _onStreamEvent(_) {
    numberOfEvents++;
  }
}
