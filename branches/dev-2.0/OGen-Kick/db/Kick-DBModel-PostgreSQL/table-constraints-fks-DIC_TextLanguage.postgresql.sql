ALTER TABLE "DIC_TextLanguage"
  ADD CONSTRAINT "DIC_TextLanguage_IFLanguage_fkey" FOREIGN KEY ("IFLanguage")
    REFERENCES "DIC_Language" ("IDLanguage") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "DIC_TextLanguage_IFText_fkey" FOREIGN KEY ("IFText")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

