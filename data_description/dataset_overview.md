# Dataset Overview

This project uses four CSV files from the Hospital Beds Management dataset.

## 1. patients.csv
| patient_id | Unique identifier |
| name | Full name |
| age | Age |
| arrival_date | Date patient entered hospital |
| departure_date | Date patient left |
| service | emergency / ICU / surgery / general_medicine |
| satisfaction | Patient satisfaction score (0–100) |

## 2. staff.csv
| staff_id | staff_name | role | service |

## 3. staff_schedule.csv
| week | month | staff_id | staff_name | role | service | present |

## 4. services_weekly.csv
| week | month | service | available_beds | patients_request | patients_admitted | patients_refused | patient_satisfaction | staff_morale | event |

Used for:
- Weekly service analysis
- Staffing patterns
- Identifying critical/flu weeks
