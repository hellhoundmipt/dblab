/*SELECT * FROM 
	sysobjects
	--syscolumns
	--systypes
	--sysreferences
	--syscomments
	--sysusers
WHERE xtype = 'U'*/
-------------------------------------------------------1
SELECT so.name, su.name FROM sysobjects so, sysusers su
WHERE so.xtype = 'U'
AND so.uid = su.uid
AND su.name = USER_NAME()

-------------------------------------------------------2
SELECT so.name, sa.name, sa.is_nullable, TYPE_NAME(sa.user_type_id) AS 'type', sa.max_length FROM sys.all_columns sa, sysobjects so, sysusers su
WHERE so.xtype = 'U'
AND so.id = sa.object_id
AND so.uid = su.uid
AND su.name = USER_NAME()

-------------------------------------------------------3
SELECT so1.name AS 'constraint', so2.name AS 'table', so1.xtype FROM sysobjects so1, sysobjects so2, sysusers su
WHERE (so1.xtype = 'PK' OR so1.xtype = 'F')
AND so1.parent_obj = so2.id
AND su.uid = so2.uid
AND su.name = USER_NAME()

-------------------------------------------------------4
SELECT so1.name AS 'constraint', so2.name AS 'from here', so3.name AS 'to here' FROM sysobjects so1, sysobjects so2, sysobjects so3, sysreferences ref,
	sysusers su
WHERE so1.id = ref.constid
AND so2.id = ref.fkeyid
AND so3.id = ref.rkeyid
AND su.uid = so2.uid
AND su.name = USER_NAME()

-------------------------------------------------------5
SELECT so.name, sc.text FROM sysobjects so, sysusers su, syscomments sc
WHERE so.xtype = 'V'
AND so.id = sc.id
AND su.uid = so.uid
AND su.name = USER_NAME()

-------------------------------------------------------6
SELECT sotr.name AS 'trigger', sotbl.name AS 'table' FROM sysobjects sotr, sysobjects sotbl, sysusers su
WHERE sotr.xtype = 'TR'
AND sotr.parent_obj = sotbl.id
AND su.uid = sotr.uid
AND su.name = USER_NAME()