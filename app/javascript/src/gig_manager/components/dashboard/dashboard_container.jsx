import React from 'react';
import PropTypes from 'prop-types';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import AvatarContainer from '../avatar/avatar_container';
import { fetchInitialData } from '../../actions/user_actions';

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
    this.props.loadDashboardData().then(() => this.setState({ isloading: false }));
  }

  render() {
    return (
      <div className="ui container">
        <div className="ui grid">
          <div className="five wide column user-data">
            <AvatarContainer
              image={'avatar' in this.props.user ? this.props.user.avatar : null}
            />
          </div>
          <div className="11 wide column gig-data">
            USER: { JSON.stringify(this.props.user) }<br />
            GIGS: { JSON.stringify(this.props.gigs) }<br />
            MUSICIANS: { JSON.stringify(this.props.musicians) }
          </div>
        </div>
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

// const mapDispatchToProps = dispatch => bindActionCreators({
//   loadDashboardData: () => () => dispatch(fetchInitialData()),
// }, dispatch)

const mapDispatchToProps = {
  loadDashboardData: () => dispatch => dispatch(fetchInitialData()),
}

const DashboardContainer = connect(mapStateToProps, mapDispatchToProps)(Dashboard);
export default DashboardContainer;
