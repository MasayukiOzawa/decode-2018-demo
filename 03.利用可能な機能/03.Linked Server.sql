USE DemoDB
GO

INSERT INTO [192.168.0.1].DemoDB.dbo.DTCT1 VALUES(2)

BEGIN TRAN
	INSERT INTO DTCT1 VALUES(1)
	INSERT INTO [192.168.0.1].DemoDB.dbo.DTCT1 VALUES(2)
COMMIT TRAN
GO

