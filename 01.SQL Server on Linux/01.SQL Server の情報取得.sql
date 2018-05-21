-- Linux の情報の取得
SELECT * FROM sys.dm_os_host_info

SELECT container_type, container_type_desc 
FROM sys.dm_os_sys_info

-- ディレクトリ構成の取得
SELECT * FROM sys.dm_os_enumerate_filesystem('/', '*') 
WHERE level =  0 ORDER BY 1

SELECT * FROM sys.dm_os_enumerate_filesystem('/', '*') 
WHERE full_filesystem_path LIKE '/binn%'  AND level =  1
ORDER BY 1

-- ロードモジュールの取得
SELECT name,  description, file_version, product_version 
FROM sys.dm_os_loaded_modules
WHERE name LIKE 'sql%'
ORDER BY 1
