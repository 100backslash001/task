package MyApp::Form::Post;
use HTML::FormHandler::Moose;
use HTML::FormHandler::Types ( 'WordChars', 'NotAllDigits' ); 
extends 'HTML::FormHandler::Model::DBIC';

has '+item_class' => ( default => 'Post' );

has_field 'title' => (
  type => 'Text',
  apply => [ NotAllDigits ], 
  required => 1,
  unique => 0,
  maxlength => 20,
);

has_field 'text' => (
  type => 'TextArea',
  apply => [ NotAllDigits ], 
  required => 1,
  unique => 0,
  maxlength => 8000,
);

has_field 'user_id' => (
  type => 'PosInteger',
  required => 0,
);

has_field 'submit' => (
  type => 'Submit',
  value => 'Post',
);

no HTML::FormHandler::Moose;

1;