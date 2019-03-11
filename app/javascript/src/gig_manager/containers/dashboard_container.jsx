import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import AvatarContainer from './avatar_container';
import { fetchInitialData } from '../actions/user_actions';

class Dashboard extends React.Component {
  static propTypes = {
    loadDashboardData: PropTypes.func,
    user: PropTypes.object,
    gigs: PropTypes.arrayOf(PropTypes.object),
    musicians: PropTypes.arrayOf(PropTypes.object),
    lastRequestedAt: PropTypes.instanceOf(Date),
    error: PropTypes.object,
  };

  state = {
    isLoading: true,
  };

  componentDidMount() {
    this.props.loadDashboardData().then(() => this.setState({ isLoading: false }));
  }

  render() {
    console.log('DashboardCOmponent render()')
    return (
      <div className="container">
        { this.state.isLoading ? (
          <div>LOADING</div>
        ) : (
          <div className="">
            <div className="user-data">
              <AvatarContainer />
            </div>
            <div className="gig-data">
              USER: { JSON.stringify(this.props.user) }<br />
              GIGS: { JSON.stringify(this.props.gigs) }<br />
              MUSICIANS: { JSON.stringify(this.props.musicians) }
            </div>
          </div>
        )}
      </div>
    )
  }
}

const mapStateToProps = state => ({
  user: state.user,
  gigs: state.gigs,
  musicians: state.musicians,
  lastRequestedAt: state.lastRequestedAt,
})

const mapDispatchToProps = {
  loadDashboardData: () => (dispatch) => dispatch(fetchInitialData()),
}

const DashboardContainer = connect(mapStateToProps, mapDispatchToProps)(Dashboard);
export default DashboardContainer;
