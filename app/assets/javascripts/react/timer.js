// require('react')
// require('react-dom')
//
//
// var CountdownTimer = React.createClass({displayName: 'CountdownTimer',
//   getInitialState: function() {
//     return {
//       secondsRemaining: 0
//     };
//   },
//   tick: function() {
//     this.setState({secondsRemaining: this.state.secondsRemaining - 1});
//     if (this.state.secondsRemaining <= 0) {
//       clearInterval(this.interval);
//     }
//   },
//   componentDidMount: function() {
//     this.setState({ secondsRemaining: this.props.secondsRemaining });
//     this.interval = setInterval(this.tick, 1000);
//   },
//   componentWillUnmount: function() {
//     clearInterval(this.interval);
//   },
//   render: function() {
//     return (
//       React.DOM.div(null, "Seconds Remaining: ", this.state.secondsRemaining)
//     );
//   }
// });
//
// React.renderComponent(CountdownTimer( {secondsRemaining:"10"} ), document.querySelector('#days'));
