import React from 'react';
import PropTypes from 'prop-types';
import {
  Form,
  FormGroup,
  Label,
  Input,
  Button,
} from 'reactstrap';

class AvatarForm extends React.Component {
  state = {
    avatarImage: this.props.avatarImage,
  }

  static propTypes = {
    isHovering: PropTypes.bool,
    avatarImage: PropTypes.string,
    updateAvatar: PropTypes.func,
  }

  handleChange = (e) => {
    e.preventDefault();
    const change = {};
    change[e.target.name] = e.target.value;
    this.setState(change);
  }

  handleSubmit = (e) => {
    // TODO... eventually call updateAvatar() ?
    // we could pass that down (as we are doing now)
    // or.... why not set into Redux directly here ?
    // preview image --> new FileReader();
  }

  // TODO: add separate div for image preview ?
  render() {
    return (
      <div className={`avatar-form-container ${this.props.isHovering ? '' : 'hidden'}`}>
        <Form>
          <FormGroup>
            <Label>Avatar Image</Label>
            <Input name="avatarImage" type="file" onChange={this.handleChange} />
          </FormGroup>
          <Button onClick={this.handleSubmit}>Update Avatar</Button>
        </Form>
      </div>
    )
  }
}

export default AvatarForm;
