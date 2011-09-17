ALTER TABLE "LOG_Log"
  ADD CONSTRAINT "LOG_Log_IFUser_fkey" FOREIGN KEY ("IFUser")
    REFERENCES "CRD_User" ("IDUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "LOG_Log_IFUser__read_fkey" FOREIGN KEY ("IFUser__read")
    REFERENCES "CRD_User" ("IDUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "LOG_Log_IFPermition_fkey" FOREIGN KEY ("IFPermition")
    REFERENCES "CRD_Permition" ("IDPermition") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "LOG_Log_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "LOG_Log_IFLogtype_fkey" FOREIGN KEY ("IFLogtype")
    REFERENCES "LOG_Logtype" ("IDLogtype") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "LOG_Log_IFErrortype_fkey" FOREIGN KEY ("IFErrortype")
    REFERENCES "LOG_Errortype" ("IDErrortype") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;
