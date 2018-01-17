CREATE TABLE dw_property (
	id float,
	objecttype char(15),
	propertyname char(40),
	propertyvalue char(100),
	modify char(1),
	remark char(100),
	expected char(100),
	col2 char(30));
INSERT INTO dw_property VALUES (
	242,
	'emp_id_t',
	'alignment',
	'''0''',
	'1',
	'''''',
	'0',
	'''''');
INSERT INTO dw_property VALUES (
	243,
	'emp_id_t',
	'alignment',
	'''1''',
	'1',
	'''''',
	'1',
	'''''');
INSERT INTO dw_property VALUES (
	244,
	'emp_id_t',
	'alignment',
	'''2''',
	'1',
	'''''',
	'2',
	'''''');
INSERT INTO dw_property VALUES (
	245,
	'emp_id_t',
	'alignment',
	'''3''',
	'1',
	'''''',
	'3',
	'''''');
INSERT INTO dw_property VALUES (
	246,
	'emp_id_t',
	'Background.Color',
	'''8388736''',
	'1',
	'''''',
	'8388736',
	'''''');
INSERT INTO dw_property VALUES (
	247,
	'emp_id_t',
	'Background.Color',
	'''8388736~trgb(255,0,0)''',
	'1',
	'''''',
	'"8388736	rgb(255,0,0)"',
	'''''');
INSERT INTO dw_property VALUES (
	248,
	'emp_id_t',
	'Background.Mode',
	'''0''',
	'1',
	'''''',
	'0',
	'''''');
INSERT INTO dw_property VALUES (
	249,
	'emp_id_t',
	'Background.Mode',
	'''1''',
	'1',
	'''''',
	'1',
	'''''');
INSERT INTO dw_property VALUES (
	250,
	'emp_id_t',
	'Band',
	'''''',
	'0',
	'''''',
	'header',
	'''''');
INSERT INTO dw_property VALUES (
	251,
	'emp_id_t',
	'border',
	'''0''',
	'1',
	'''''',
	'0',
	'''''');
INSERT INTO dw_property VALUES (
	252,
	'emp_id_t',
	'border',
	'''1''',
	'1',
	'''''',
	'1',
	'''''');
INSERT INTO dw_property VALUES (
	253,
	'emp_id_t',
	'border',
	'''2''',
	'1',
	'''''',
	'2',
	'''''');
INSERT INTO dw_property VALUES (
	254,
	'emp_id_t',
	'border',
	'''3''',
	'1',
	'''''',
	'3',
	'''''');
INSERT INTO dw_property VALUES (
	255,
	'emp_id_t',
	'border',
	'''4''',
	'1',
	'''''',
	'4',
	'''''');
INSERT INTO dw_property VALUES (
	256,
	'emp_id_t',
	'border',
	'''5''',
	'1',
	'''''',
	'5',
	'''''');
INSERT INTO dw_property VALUES (
	257,
	'emp_id_t',
	'border',
	'''6''',
	'1',
	'''''',
	'6',
	'''''');
INSERT INTO dw_property VALUES (
	258,
	'emp_id_t',
	'Color',
	'''65536''',
	'1',
	'''''',
	'65536',
	'''''');
INSERT INTO dw_property VALUES (
	259,
	'emp_id_t',
	'Color',
	'''0~tIf(salary>90000,255,65280)''',
	'1',
	'''''',
	'"0	If(salary>90000,255,65280)"',
	'''''');
INSERT INTO dw_property VALUES (
	260,
	'emp_id_t',
	'Font.CharSet',
	'''1''',
	'1',
	'''''',
	'1',
	'''''');
INSERT INTO dw_property VALUES (
	261,
	'emp_id_t',
	'Font.CharSet',
	'''2''',
	'1',
	'''''',
	'2',
	'''''');
INSERT INTO dw_property VALUES (
	262,
	'emp_id_t',
	'Font.CharSet',
	'''128''',
	'1',
	'''''',
	'128',
	'''''');
INSERT INTO dw_property VALUES (
	263,
	'emp_id_t',
	'Font.CharSet',
	'''255''',
	'1',
	'''''',
	'255',
	'''''');
INSERT INTO dw_property VALUES (
	264,
	'emp_id_t',
	'Font.CharSet',
	'''0''',
	'1',
	'''''',
	'0',
	'''''');
INSERT INTO dw_property VALUES (
	265,
	'emp_id_t',
	'font.face',
	'''Arial''',
	'1',
	'''''',
	'Arial',
	'''''');
INSERT INTO dw_property VALUES (
	266,
	'emp_id_t',
	'font.face',
	'''Tahoma''',
	'1',
	'''''',
	'Tahoma',
	'''''');
INSERT INTO dw_property VALUES (
	267,
	'emp_id_t',
	'font.orientation',
	'''450''',
	'1',
	'''''',
	'450',
	'''''');
INSERT INTO dw_property VALUES (
	268,
	'emp_id_t',
	'Font.escapement',
	'''450''',
	'1',
	'''''',
	'450',
	'''''');
INSERT INTO dw_property VALUES (
	269,
	'emp_id_t',
	'Font.escapement',
	'''0''',
	'1',
	'''''',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	270,
	'emp_id_t',
	'font.family',
	'''0''',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	271,
	'emp_id_t',
	'font.family',
	'''1''',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	272,
	'emp_id_t',
	'font.family',
	'''2''',
	'1',
	' ',
	'2',
	' ');
INSERT INTO dw_property VALUES (
	273,
	'emp_id_t',
	'font.family',
	'''3''',
	'1',
	' ',
	'3',
	' ');
INSERT INTO dw_property VALUES (
	274,
	'emp_id_t',
	'font.family',
	'''4''',
	'1',
	' ',
	'4',
	' ');
INSERT INTO dw_property VALUES (
	275,
	'emp_id_t',
	'font.family',
	'''5''',
	'1',
	' ',
	'5',
	' ');
INSERT INTO dw_property VALUES (
	279,
	'emp_id_t',
	'font.height',
	'''100''',
	'1',
	' ',
	'100',
	' ');
INSERT INTO dw_property VALUES (
	280,
	'emp_id_t',
	'font.height',
	'''-10''',
	'1',
	' ',
	'-10',
	' ');
INSERT INTO dw_property VALUES (
	281,
	'emp_id_t',
	'font.italic',
	'1',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	282,
	'emp_id_t',
	'font.italic',
	'0',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	283,
	'emp_id_t',
	'font.italic',
	'yes',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	284,
	'emp_id_t',
	'font.italic',
	'no',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	285,
	'emp_id_t',
	'font.pitch',
	'''0''',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	286,
	'emp_id_t',
	'font.pitch',
	'''1''',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	287,
	'emp_id_t',
	'font.pitch',
	'''2''',
	'1',
	' ',
	'2',
	' ');
INSERT INTO dw_property VALUES (
	304,
	'emp_id_t',
	'font.strikethrough',
	'''1''',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	305,
	'emp_id_t',
	'font.strikethrough',
	'no',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	306,
	'emp_id_t',
	'font.strikethrough',
	'yes',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	307,
	'emp_id_t',
	'font.strikethrough',
	'''0''',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	308,
	'emp_id_t',
	'font.underline',
	'''1''',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	309,
	'emp_id_t',
	'font.underline',
	'no',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	310,
	'emp_id_t',
	'font.underline',
	'yes',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	311,
	'emp_id_t',
	'font.underline',
	'''0''',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	312,
	'emp_id_t',
	'font.weight',
	'400',
	'1',
	' ',
	'400',
	' ');
INSERT INTO dw_property VALUES (
	313,
	'emp_id_t',
	'font.weight',
	'''700''',
	'1',
	' ',
	'700',
	' ');
INSERT INTO dw_property VALUES (
	314,
	'emp_id_t',
	'font.width',
	'''20''',
	'1',
	' ',
	'20',
	' ');
INSERT INTO dw_property VALUES (
	315,
	'emp_id_t',
	'height',
	'70',
	'1',
	' ',
	'70',
	' ');
INSERT INTO dw_property VALUES (
	316,
	'emp_id_t',
	'hidesnaked',
	'1',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	317,
	'emp_id_t',
	'hidesnaked',
	'0',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	318,
	'emp_id_t',
	'height.autosize',
	'yes',
	'1',
	' ',
	'yes',
	' ');
INSERT INTO dw_property VALUES (
	319,
	'emp_id_t',
	'height.autosize',
	'''no''',
	'1',
	' ',
	'no',
	' ');
INSERT INTO dw_property VALUES (
	320,
	'emp_id_t',
	'html.appendedhtml',
	'''appendtext''',
	'1',
	' ',
	'appendtext',
	' ');
INSERT INTO dw_property VALUES (
	321,
	'emp_id_t',
	'html.link',
	'''empform.html''',
	'1',
	' ',
	'empform.html',
	' ');
INSERT INTO dw_property VALUES (
	331,
	'emp_id_t',
	'html.linkargs',
	'~"EMP_ID = ''empid''~"',
	'1',
	' ',
	'EMP_ID = ''empid''',
	' ');
INSERT INTO dw_property VALUES (
	332,
	'emp_id_t',
	'html.linktarget',
	'''detail_win''',
	'1',
	' ',
	'detail_win',
	' ');
INSERT INTO dw_property VALUES (
	333,
	'emp_id_t',
	'html.valueishtml',
	'''true''',
	'1',
	' ',
	'true',
	' ');
INSERT INTO dw_property VALUES (
	334,
	'emp_id_t',
	'moveable',
	'''1''',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	335,
	'emp_id_t',
	'moveable',
	'0',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	336,
	'emp_id_t',
	'name',
	'emp_id_t',
	'0',
	' ',
	'emp_id_t',
	'  ');
INSERT INTO dw_property VALUES (
	337,
	'emp_id_t',
	'pointer',
	'''HyperLink!''',
	'1',
	' ',
	'"HyperLink!"',
	' ');
INSERT INTO dw_property VALUES (
	338,
	'emp_id_t',
	'resizeable',
	'''1''',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	339,
	'emp_id_t',
	'resizeable',
	'0',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	341,
	'emp_id_t',
	'slideleft',
	'yes',
	'1',
	' ',
	'yes',
	' ');
INSERT INTO dw_property VALUES (
	342,
	'emp_id_t',
	'slideleft',
	'''no''',
	'1',
	' ',
	'no',
	' ');
INSERT INTO dw_property VALUES (
	343,
	'emp_id_t',
	'slideup',
	'AllAbove',
	'1',
	' ',
	'allabove',
	' ');
INSERT INTO dw_property VALUES (
	344,
	'emp_id_t',
	'slideup',
	'DirectlyAbove',
	'1',
	' ',
	'directlyabove',
	' ');
INSERT INTO dw_property VALUES (
	345,
	'emp_id_t',
	'slideup',
	'no',
	'1',
	' ',
	'no',
	' ');
INSERT INTO dw_property VALUES (
	346,
	'emp_id_t',
	'tag',
	'''Header of Employee ID''',
	'1',
	' ',
	'Header of Employee ID',
	' ');
INSERT INTO dw_property VALUES (
	347,
	'emp_id_t',
	'text',
	'''Employee Name''',
	'1',
	' ',
	'Employee Name',
	' ');
INSERT INTO dw_property VALUES (
	348,
	'emp_id_t',
	'type',
	'text',
	'0',
	' ',
	'text',
	' ');
INSERT INTO dw_property VALUES (
	349,
	'emp_id_t',
	'visible',
	'no',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	350,
	'emp_id_t',
	'visible',
	'yes',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	351,
	'emp_id_t',
	'visible',
	'0',
	'1',
	' ',
	'0',
	' ');
INSERT INTO dw_property VALUES (
	352,
	'emp_id_t',
	'visible',
	'1',
	'1',
	' ',
	'1',
	' ');
INSERT INTO dw_property VALUES (
	353,
	'emp_id_t',
	'width',
	'400',
	'1',
	' ',
	'400',
	' ');
INSERT INTO dw_property VALUES (
	354,
	'emp_id_t',
	'x',
	'400',
	'1',
	' ',
	'400',
	' ');
INSERT INTO dw_property VALUES (
	355,
	'emp_id_t',
	'y',
	'25',
	'1',
	' ',
	'25',
	' ');
