package MyApp::Form::User;
use HTML::FormHandler::Moose;
use HTML::FormHandler::Types ('NoSpaces', 'WordChars', 'NotAllDigits', 'SimpleStr' ); 
extends 'HTML::FormHandler::Model::DBIC';

has '+item_class' => ( default => 'User' );

has_field 'login' => (
  type => 'Text',
  apply => [ NoSpaces, WordChars, NotAllDigits ], 
  required => 1,
  unique => 1,
  maxlength => 25,
);

has_field 'password' => (
  type => 'Password',
  apply => [ NoSpaces, WordChars, NotAllDigits ], 
  required => 1,
  maxlength => 25,
);

has_field 'password_confirm' => (
  type => 'PasswordConf',
  tags => { label_after => ': ' }, 
);

has_field 'email' => (
  type  => 'Email',
  required => 1,
  unique => 1,
  maxlength => 45,
);

has_field 'submit' => (
  type => 'Submit',
  value => 'Submit',
);

no HTML::FormHandler::Moose;

1;