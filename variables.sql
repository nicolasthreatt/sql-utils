-- Initial Variable Type
DECLARE @VariableName INT = 6;

-- Set Variable
SET @VariableName = 23;

SELECT @VariableName AS VariableValue
     , @VariableName * 6 AS Multiplication
     , @VariableName + 6 AS Addition


-- Use variable as a counter
DECLARE @Counter INT = 1;

WHILE @Counter <= 3
BEGIN
    SELECT @Counter AS CurrentValue
    SET @Counter += 1
END