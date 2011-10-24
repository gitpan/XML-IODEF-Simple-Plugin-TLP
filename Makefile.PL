use inc::Module::Install;

name        'XML-IODEF-Simple-Plugin-TLP';
all_from    'lib/XML/IODEF/Simple/Plugin/TLP.pm';

requires    'XML::IODEF::Simple'            => '0.00';

WriteAll();
