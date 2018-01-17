CREATE TABLE application (
	appl_no decimal(16, 0),
	appl_name char(30),
	appl_description char(100),
	appl_liblist char(253),
	modified_by char(40),
	modified_dt datetime);
INSERT INTO application VALUES (
	153,
	'dwproperty',
	'Datawindow properties modify/describe/dot notation / syntaxfromsql',
	'dwproperty.pbl',
	'gaoh',
	'2005-01-25 00:00:00.000000');
