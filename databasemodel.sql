
-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `user_id` TINYINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account` ;

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` TINYINT   NOT NULL AUTO_INCREMENT,
  `created` DATE NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `user_id` TINYINT,
  `username` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  PRIMARY KEY (`account_id`),
  INDEX `FK_USER_ACCOUNT_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_USER_ACCOUNT`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insurance` ;

CREATE TABLE IF NOT EXISTS `insurance` (
  `insurance_id` TINYINT NOT NULL,
  `insurance_type` VARCHAR(45) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `user_id` TINYINT NOT NULL,
  PRIMARY KEY (`insurance_id`),
  INDEX `FK_USER_INSURANCE_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_USER_INSURANCE`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appointments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appointments` ;

CREATE TABLE IF NOT EXISTS `appointments` (
  `appointment_id` TINYINT NOT NULL AUTO_INCREMENT,
  `appointment_date` DATETIME NOT NULL,
  `user_id` TINYINT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `appointment_for` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `FK_USER_APPOINTMENT_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_USER_APPOINTMENT`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital` ;

CREATE TABLE IF NOT EXISTS `hospital` (
  `reg_no` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip` INT NOT NULL,
  `state` CHAR(2) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `estd` YEAR NULL,
  PRIMARY KEY (`reg_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee` ;

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` TINYINT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATETIME NOT NULL,
  `reg_no` TINYINT NOT NULL,
  `ssn` BIGINT NOT NULL,
  INDEX `FK_WORK_FOR_idx` (`reg_no` ASC) VISIBLE,
  PRIMARY KEY (`employee_id`),
  UNIQUE INDEX `ssn_UNIQUE` (`ssn` ASC) VISIBLE,
  CONSTRAINT `FK_WORK_FOR`
    FOREIGN KEY (`reg_no`)
    REFERENCES `hospital` (`reg_no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `doctor` ;

CREATE TABLE IF NOT EXISTS `doctor` (
  `type` VARCHAR(45) NOT NULL,
  `liscence_no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `employee_id` TINYINT NOT NULL,
  PRIMARY KEY (`liscence_no`),
  INDEX `FK_DOCTOR_EMP_ID_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `FK_DOCTOR_EMP_ID`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nurse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nurse` ;

CREATE TABLE IF NOT EXISTS `nurse` (
  `liscence_no` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `shift` VARCHAR(45) NOT NULL,
  `employee_id` TINYINT NOT NULL,
  PRIMARY KEY (`liscence_no`),
  INDEX `FK_NURSE_EMP_ID_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `FK_NURSE_EMP_ID`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `department` ;

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` TINYINT NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `reg_no` TINYINT NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `FK_OWNED_BY_idx` (`reg_no` ASC) VISIBLE,
  CONSTRAINT `FK_OWNED_BY`
    FOREIGN KEY (`reg_no`)
    REFERENCES `hospital` (`reg_no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `patient` ;

CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` TINYINT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `insurance_id` TINYINT NULL,
  `reg_no` TINYINT NOT NULL,
  `room_no` SMALLINT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `FK_PATIENT_INSURANCE_ID_idx` (`insurance_id` ASC) VISIBLE,
  INDEX `FK_PATIENT_IN_idx` (`reg_no` ASC) VISIBLE,
  CONSTRAINT `FK_PATIENT_INSURANCE_ID`
    FOREIGN KEY (`insurance_id`)
    REFERENCES `insurance` (`insurance_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PATIENT_IN`
    FOREIGN KEY (`reg_no`)
    REFERENCES `hospital` (`reg_no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lab` ;

CREATE TABLE IF NOT EXISTS `lab` (
  `lab_id` TINYINT NOT NULL,
  `order_id` TINYINT NOT NULL,
  `test_info` VARCHAR(45) NULL,
  `test_result` VARCHAR(45) NULL,
  `department_id` TINYINT NOT NULL,
  `patient_id` TINYINT NOT NULL,
  PRIMARY KEY (`lab_id`),
  INDEX `FK_LAB_DEPARTMENT_idx` (`department_id` ASC) VISIBLE,
  INDEX `FK_LAB_PATIENT_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `FK_LAB_DEPARTMENT`
    FOREIGN KEY (`department_id`)
    REFERENCES `department` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_LAB_PATIENT`
    FOREIGN KEY (`patient_id`)
    REFERENCES `patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test` ;

CREATE TABLE IF NOT EXISTS `test` (
  `test_id` INT NOT NULL,
  `test_type` VARCHAR(45) NOT NULL,
  `test_date` DATETIME NOT NULL,
  PRIMARY KEY (`test_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `patient_has_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `patient_has_test` ;

CREATE TABLE IF NOT EXISTS `patient_has_test` (
  `patient_patient_id` TINYINT NOT NULL,
  `test_test_id` INT NOT NULL,
  PRIMARY KEY (`patient_patient_id`, `test_test_id`),
  INDEX `fk_patient_has_test_test1_idx` (`test_test_id` ASC) VISIBLE,
  INDEX `fk_patient_has_test_patient1_idx` (`patient_patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_patient_has_test_patient1`
    FOREIGN KEY (`patient_patient_id`)
    REFERENCES `patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_has_test_test1`
    FOREIGN KEY (`test_test_id`)
    REFERENCES `test` (`test_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prescription` ;

CREATE TABLE IF NOT EXISTS `prescription` (
  `prescription_id` TINYINT NOT NULL,
  `patient_id` TINYINT NOT NULL,
  `dosage` VARCHAR(45) NOT NULL,
  `prescribed_date` DATETIME NOT NULL,
  PRIMARY KEY (`prescription_id`),
  INDEX `FK_PRESCRIBED_PATIENT_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `FK_PRESCRIBED_PATIENT`
    FOREIGN KEY (`patient_id`)
    REFERENCES `patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pharmacy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pharmacy` ;

CREATE TABLE IF NOT EXISTS `pharmacy` (
  `pharmacy_id` TINYINT NOT NULL,
  `drug_info` VARCHAR(45) NOT NULL,
  `order_id` TINYINT NOT NULL,
  `department_id` TINYINT NOT NULL,
  `prescription_id` TINYINT NULL,
  PRIMARY KEY (`pharmacy_id`),
  INDEX `FK_DPT_ID_idx` (`department_id` ASC) VISIBLE,
  INDEX `FK_PRESCRIPTION_ID_idx` (`prescription_id` ASC) VISIBLE,
  CONSTRAINT `FK_DPT_ID`
    FOREIGN KEY (`department_id`)
    REFERENCES `department` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRESCRIPTION_ID`
    FOREIGN KEY (`prescription_id`)
    REFERENCES `prescription` (`prescription_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `technical_dpt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `technical_dpt` ;

CREATE TABLE IF NOT EXISTS `technical_dpt` (
  `department_id` TINYINT NOT NULL,
  `equipment_info` VARCHAR(255) NOT NULL,
  `maintainence_record` VARCHAR(255) NOT NULL,
  `maintainence_date` DATETIME NOT NULL,
  PRIMARY KEY (`department_id`),
  CONSTRAINT `FK_dept_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `department` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `visitor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `visitor` ;

CREATE TABLE IF NOT EXISTS `visitor` (
  `visitor_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `time_stamp` DATETIME NOT NULL,
  PRIMARY KEY (`visitor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reception`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reception` ;

CREATE TABLE IF NOT EXISTS `reception` (
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `patient_id` TINYINT NOT NULL,
  `visitor_id` TINYINT NOT NULL,
  `time_stamp` DATETIME NOT NULL,
  PRIMARY KEY (`visitor_id`),
  UNIQUE INDEX `patient_id_UNIQUE` (`patient_id` ASC) VISIBLE,
  INDEX `FK_VISITOR_INFO_idx` (`visitor_id` ASC) VISIBLE,
  CONSTRAINT `FK_PATIENT_RECORD`
    FOREIGN KEY (`patient_id`)
    REFERENCES `patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_VISITOR_INFO`
    FOREIGN KEY (`visitor_id`)
    REFERENCES `visitor` (`visitor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `patient_has_prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `patient_has_prescription` ;

CREATE TABLE IF NOT EXISTS `patient_has_prescription` (
  `patient_patient_id` TINYINT NOT NULL,
  `prescription_prescription_Id` TINYINT NOT NULL,
  PRIMARY KEY (`patient_patient_id`, `prescription_prescription_Id`),
  INDEX `fk_patient_has_prescription_prescription1_idx` (`prescription_prescription_Id` ASC) VISIBLE,
  INDEX `fk_patient_has_prescription_patient1_idx` (`patient_patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_patient_has_prescription_patient1`
    FOREIGN KEY (`patient_patient_id`)
    REFERENCES `patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_has_prescription_prescription1`
    FOREIGN KEY (`prescription_prescription_Id`)
    REFERENCES `prescription` (`prescription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medical_record`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medical_record` ;

CREATE TABLE IF NOT EXISTS `medical_record` (
  `medical_record_no` TINYINT NOT NULL,
  `height` DECIMAL NOT NULL,
  `weight` TINYINT NOT NULL,
  `age` TINYINT NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `race` VARCHAR(45) NOT NULL,
  `blood_type` VARCHAR(45) NOT NULL,
  `blood_preassure` TINYINT NOT NULL,
  `patient_id` TINYINT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`medical_record_no`),
  INDEX `FK_PATIENT_RECORD_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `FK_PATIENT_MEDICAL_RECORD`
    FOREIGN KEY (`patient_id`)
    REFERENCES `patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `patient_has_medical_record`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `patient_has_medical_record` ;

CREATE TABLE IF NOT EXISTS `patient_has_medical_record` (
  `patient_patient_id` TINYINT NOT NULL,
  `medical_record_medical_record_no` TINYINT NOT NULL,
  PRIMARY KEY (`patient_patient_id`, `medical_record_medical_record_no`),
  INDEX `fk_patient_has_medical_record_medical_record1_idx` (`medical_record_medical_record_no` ASC) VISIBLE,
  INDEX `fk_patient_has_medical_record_patient1_idx` (`patient_patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_patient_has_medical_record_patient1`
    FOREIGN KEY (`patient_patient_id`)
    REFERENCES `patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_has_medical_record_medical_record1`
    FOREIGN KEY (`medical_record_medical_record_no`)
    REFERENCES `medical_record` (`medical_record_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


