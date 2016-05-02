--
-- This updates a 1.28.108 database to 1.28.109
--

--
-- Add Controls definition for Vivotek ePTZ
--
INSERT INTO Controls 
SELECT * FROM (SELECT NULL as Id,
                    'Vivotek ePTZ' as Name,
                    'Remote' as Type,
                    'Vivotek_ePTZ' as Protocol,
                    0 as CanWake,
                    0 as CanSleep,
                    1 as CanReset,
                    1 as CanZoom,
                    0 as CanAutoZoom,
                    0 as CanZoomAbs,
                    0 as CanZoomRel,
                    1 as CanZoomCon,
                    0 as MinZoomRange,
                    0 as MaxZoomRange,
                    0 as MinZoomStep,
                    0 as MaxZoomStep,
                    1 as HasZoomSpeed,
                    0 as MinZoomSpeed,
                    5 as MaxZoomSpeed,
                    0 as CanFocus,
                    0 as CanAutoFocus,
                    0 as CanFocusAbs,
                    0 as CanFocusRel,
                    0 as CanFocusCon,
                    0 as MinFocusRange,
                    0 as MaxFocusRange,
                    0 as MinFocusStep,
                    0 as MaxFocusStep,
                    0 as HasFocusSpeed,
                    0 as MinFocusSpeed,
                    0 as MaxFocusSpeed,
                    0 as CanIris,
                    0 as CanAutoIris,
                    0 as CanIrisAbs,
                    0 as CanIrisRel,
                    0 as CanIrisCon,
                    0 as MinIrisRange,
                    0 as MaxIrisRange,
                    0 as MinIrisStep,
                    0 as MaxIrisStep,
                    0 as HasIrisSpeed,
                    0 as MinIrisSpeed,
                    0 as MaxIrisSpeed,
                    0 as CanGain,
                    0 as CanAutoGain,
                    0 as CanGainAbs,
                    0 as CanGainRel,
                    0 as CanGainCon,
                    0 as MinGainRange,
                    0 as MaxGainRange,
                    0 as MinGainStep,
                    0 as MaxGainStep,
                    0 as HasGainSpeed,
                    0 as MinGainSpeed,
                    0 as MaxGainSpeed,
                    0 as CanWhite,
                    0 as CanAutoWhite,
                    0 as CanWhiteAbs,
                    0 as CanWhiteRel,
                    0 as CanWhiteCon,
                    0 as MinWhiteRange,
                    0 as MaxWhiteRange,
                    0 as MinWhiteStep,
                    0 as MaxWhiteStep,
                    0 as HasWhiteSpeed,
                    0 as MinWhiteSpeed,
                    0 as MaxWhiteSpeed,
                    0 as HasPresets,
                    0 as NumPresets,
                    0 as HasHomePreset,
                    0 as CanSetPresets,
                    1 as CanMove,
                    0 as CanMoveDiag,
                    0 as CanMoveMap,
                    0 as CanMoveAbs,
                    0 as CanMoveRel,
                    1 as CanMoveCon,
                    1 as CanPan,
                    0 as MinPanRange,
                    0 as MaxPanRange,
                    0 as MinPanStep,
                    0 as MaxPanStep,
                    1 as HasPanSpeed,
                    0 as MinPanSpeed,
                    5 as MaxPanSpeed,
                    0 as HasTurboPan,
                    0 as TurboPanSpeed,
                    1 as CanTilt,
                    0 as MinTiltRange,
                    0 as MaxTiltRange,
                    0 as MinTiltStep,
                    0 as MaxTiltStep,
                    1 as HasTiltSpeed,
                    0 as MinTiltSpeed,
                    5 as MaxTiltSpeed,
                    0 as HasTurboTilt,
                    0 as TurboTiltSpeed,
                    0 as CanAutoScan,
                    0 as NumScanPaths) AS tmp
WHERE NOT EXISTS (
    SELECT Name FROM Controls WHERE name = 'Vivotek ePTZ'
) LIMIT 1;

SET @s = (SELECT IF(
    (SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.TABLES
    WHERE table_name = 'Storage'
    AND table_schema = DATABASE()
    ) > 0,
"SELECT 'Storage table exists'",
"CREATE TABLE `Storage` (
    `Id`    smallint(5) unsigned NOT NULL auto_increment,
    `Path`  varchar(64) NOT NULL default '',
    `Name`  varchar(64) NOT NULL default '',
    PRIMARY KEY (`Id`)
)"
));

PREPARE stmt FROM @s;
EXECUTE stmt;

--
-- Add StorageId column to Monitors
--

SET @s = (SELECT IF(
    (SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'Monitors'
    AND table_schema = DATABASE()
    AND column_name = 'StorageId'
    ) > 0,
"SELECT 'Column StorageId exists in Monitors'",
"ALTER TABLE Monitors ADD `StorageId` smallint(5) unsigned AFTER `ServerId`"
));

PREPARE stmt FROM @s;
EXECUTE stmt;

--
-- Add StorageId column to Eventss
--

SET @s = (SELECT IF(
    (SELECT COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'Events'
    AND table_schema = DATABASE()
    AND column_name = 'StorageId'
    ) > 0,
"SELECT 'Column StorageId exists in Events'",
"ALTER TABLE Events ADD `StorageId` smallint(5) unsigned AFTER `MonitorId`"
));

PREPARE stmt FROM @s;
EXECUTE stmt;
