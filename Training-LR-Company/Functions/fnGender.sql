CREATE FUNCTION [dbo].[fnGender]
(
	@Gender int
)
RETURNS NVARCHAR
AS
BEGIN
IF (@Gender = 1)
	RETURN 'männlich'
IF (@Gender = 2)
	RETURN 'weiblich'
IF (@Gender = 3)
	RETURN 'keine Angabe'
RETURN @Gender
END
