CREATE FUNCTION [dbo].[fnGender]
(
	@Gender int
)
RETURNS NVARCHAR(16)
AS
BEGIN
RETURN case @Gender 
			when 1 then 'männlich'
			when 2 then 'weiblich'
			when 3 then 'keine Angabe'
			else ''
		end
END
