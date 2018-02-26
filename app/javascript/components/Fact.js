import React from "react"
import PropTypes from "prop-types"
class Fact extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div class="container container-table text-center">
            <div class="row vertical-center-row">
              <div class="col-md-8 col-md-offset-2">
                <h1>On this day .. 6 months ago</h1>
                <h2>{this.props.factText}</h2>
              </div>
            </div>
        </div>
      </React.Fragment>
    );
  }
}

Fact.propTypes = {
  factText: PropTypes.string
};
export default Fact
