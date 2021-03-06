ALTER TABLE "NWS_ContentAuthor"
  ADD CONSTRAINT "NWS_ContentAuthor_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_ContentAuthor_IFAuthor_fkey" FOREIGN KEY ("IFAuthor")
    REFERENCES "NWS_Author" ("IDAuthor") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

