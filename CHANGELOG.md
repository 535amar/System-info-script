# CHangelog
 All notable changes to this project will be documented in this file.

----
## [V1.0.0] -2025-08-16
- Initial release of script(Bash version).
- Basic system info displayed using 'neofetch'.


## Notes
- Error handling and robustness improvements planned for next update


####[v1.1.0] -2025-08-17

##Added
**run_fetchii.sh** (old run_neofetch.sh)
- Added logging: system info now saved to "run_fatchii.log"
- Faster setup: Neofetch cloned with '--deep=1'.
- Improved error handling with 'set -euo pipefail'.
- FIt dependency check 
- Validates Neofetch executable before running
**system_info.sh*
- Enhanced information of CPU,RAM,and disk usage output.
- Added check for '/proc' availability for safer execution.
- Improved readability for minimal environments.

##Changed
- Changed the name of the scrpt from **run_neofetch.sh to run_fetchii.sh**
- Code cleanup across both scripts.
