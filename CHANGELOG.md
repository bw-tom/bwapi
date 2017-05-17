# Changelog
All notable changes to this project will be documented in this file.

## 13.3.0
* Added retry failed connection for requests
* Fixed minor Rubocop error in configuration

## 12.0.0
### Added
* NoTask - Added ditto endpoint
* NoTask - Added host location overrides endpoint
* NoTask - Added brandwatch commandcenter module
* NoTask - Added client sublcient,users and usergroups endpoints
* QA-2458 - Added client price structures endpoint
* NoTask - Added additional client users endpoint
* NoTask - Added reseller mention usage report endpoint
* QA-685 - Added options for twitter credentials endpoint
* ENT-1048 - Added client usage endpoint
* NRP-3051 - Added alerts endpoint
* ENT-940 - Added client usage report endpoint
* ENT-939 - Added pricing upgrades endpoint
* NRP-3198 - Added move query endpoint
* ENT-1477 - Added additional client subclients endpoint
* ENT-1454 - Added moving clients endpoint
* NoTask - Added move pricing options endpoint

### Fixed
* NoTask - Fixed typo in client/users endpoint

## 11.0.0
### Added
* NoTask - Add aggregates endpoint
* NoTask - Adding price structures endpoints
* NoTask - Adding data headlines endpoint
* NoTask - Added specific data aggregate endpoints
* NoTask - Added /author endpoints
* QA-1746 - Added Dimensions endpoint
* QA-720 - Added new emoticons, hashtags, mentioned authors and urls endpoints
* NoTask - Added demographics classify endpoint
* 162 - access token expiry_ins time
* QA-752 - Added log level, usage reports and mention find endpoints
* NoTask - Added missing /commandcenter endpoints
* NoTask - Added missing /brandwatch command center endpoints
* NoTask - Added instagram endpoints

### Fixed
* NoTask - removing instances of super admin from comments
* NoTask Added options to category colour and tag colour endpoints

## 10.0.0
### Added
* NoTask - added brandwatch client user post method
* NoTask - updated brandwatch client modules endpoint
* NoTask - updated travis.yml to create pre release gem on staging branch
* NoTask - Refactored request to break out request options logic
* NoTask - Added csv middleware and the ability to include a response extension

### Fixed
* NoTask - Added missing client_id for PUT brandwatch/clients/client_id/modules
* 158 - fixed small bug where options could not be passed in client_user_groups method

## 9.2.0
### Added
* NoTask - added admin clients usergroups endpoints

## 9.1.0
### Added
* NoTask - added parent client endpoints

## 9.0.1
### Fixed
* NoTask - fixed middleware conflict with the bw_status_board_api gem

## 9.0.0
### Added
* NoTask - updated notifications endpoints to match new structure
* NoTask - refactored configuration and defaults classes
* NoTask - removed hashie middleware in favour of OJ for improved performance
* NoTask - Implemented signals groups endpoints
* NoTask - Implemented mention notes endpoints
* #112 - Create logger middleware
* #113 - Create performance middleware
* #129 - Update README.md following latest updates
* #130 - Add separate CONTRIBUTING.md and CHANGELOG.md
* #133 - Updated method comments to return Hash instead of Hashie::Mash

### Fixed
* NoTask - remove unwanted opts from mentions note get request
