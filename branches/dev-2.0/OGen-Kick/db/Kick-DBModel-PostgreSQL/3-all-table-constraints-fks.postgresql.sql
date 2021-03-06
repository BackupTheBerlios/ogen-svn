ALTER TABLE "CRD_User"
  ADD CONSTRAINT "CRD_User_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "CRD_ProfilePermition"
  ADD CONSTRAINT "CRD_ProfilePermition_IFProfile_fkey" FOREIGN KEY ("IFProfile")
    REFERENCES "CRD_Profile" ("IDProfile") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "CRD_ProfilePermition_IFPermition_fkey" FOREIGN KEY ("IFPermition")
    REFERENCES "CRD_Permition" ("IDPermition") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "DIC_Language"
  ADD CONSTRAINT "DIC_Language_TX_Name_fkey" FOREIGN KEY ("TX_Name")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "DIC_Text"
  ADD CONSTRAINT "DIC_Text_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "DIC_TextLanguage"
  ADD CONSTRAINT "DIC_TextLanguage_IFLanguage_fkey" FOREIGN KEY ("IFLanguage")
    REFERENCES "DIC_Language" ("IDLanguage") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "DIC_TextLanguage_IFText_fkey" FOREIGN KEY ("IFText")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "DIC_LanguageApplication"
  ADD CONSTRAINT "DIC_LanguageApplication_IFLanguage_fkey" FOREIGN KEY ("IFLanguage")
    REFERENCES "DIC_Language" ("IDLanguage") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "DIC_LanguageApplication_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_Attachment"
  ADD CONSTRAINT "NWS_Attachment_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Attachment_TX_Description_fkey" FOREIGN KEY ("TX_Description")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Attachment_TX_Name_fkey" FOREIGN KEY ("TX_Name")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_ContentTag"
  ADD CONSTRAINT "NWS_ContentTag_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_ContentTag_IFTag_fkey" FOREIGN KEY ("IFTag")
    REFERENCES "NWS_Tag" ("IDTag") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_ContentSource"
  ADD CONSTRAINT "NWS_ContentSource_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_ContentSource_IFSource_fkey" FOREIGN KEY ("IFSource")
    REFERENCES "NWS_Source" ("IDSource") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_ContentHighlight"
  ADD CONSTRAINT "NWS_ContentHighlight_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_ContentHighlight_IFHighlight_fkey" FOREIGN KEY ("IFHighlight")
    REFERENCES "NWS_Highlight" ("IDHighlight") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_ContentAuthor"
  ADD CONSTRAINT "NWS_ContentAuthor_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_ContentAuthor_IFAuthor_fkey" FOREIGN KEY ("IFAuthor")
    REFERENCES "NWS_Author" ("IDAuthor") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_Content"
  ADD CONSTRAINT "NWS_Content_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Content_IFUser__Publisher_fkey" FOREIGN KEY ("IFUser__Publisher")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Content_tx_summary_fkey" FOREIGN KEY ("tx_summary")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Content_tx_subtitle_fkey" FOREIGN KEY ("tx_subtitle")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Content_TX_Content_fkey" FOREIGN KEY ("TX_Content")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Content_TX_Title_fkey" FOREIGN KEY ("TX_Title")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Content_IFUser__Aproved_fkey" FOREIGN KEY ("IFUser__Aproved")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "FOR_Message"
  ADD CONSTRAINT "FOR_Message_IFMessage__parent_fkey" FOREIGN KEY ("IFMessage__parent")
    REFERENCES "FOR_Message" ("IDMessage") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "FOR_Message_IFUser__Publisher_fkey" FOREIGN KEY ("IFUser__Publisher")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "FOR_Message_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_Source"
  ADD CONSTRAINT "NWS_Source_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Source_IFSource__parent_fkey" FOREIGN KEY ("IFSource__parent")
    REFERENCES "NWS_Source" ("IDSource") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Source_IFUser__Approved_fkey" FOREIGN KEY ("IFUser__Approved")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_Highlight"
  ADD CONSTRAINT "NWS_Highlight_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Highlight_IFHighlight__parent_fkey" FOREIGN KEY ("IFHighlight__parent")
    REFERENCES "NWS_Highlight" ("IDHighlight") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Highlight_IFUser__Approved_fkey" FOREIGN KEY ("IFUser__Approved")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_Author"
  ADD CONSTRAINT "NWS_Author_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Author_IFUser__Approved_fkey" FOREIGN KEY ("IFUser__Approved")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_Tag"
  ADD CONSTRAINT "NWS_Tag_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Tag_IFTag__parent_fkey" FOREIGN KEY ("IFTag__parent")
    REFERENCES "NWS_Tag" ("IDTag") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Tag_TX_Name_fkey" FOREIGN KEY ("TX_Name")
    REFERENCES "DIC_Text" ("IDText") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Tag_IFUser__Approved_fkey" FOREIGN KEY ("IFUser__Approved")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_ContentProfile"
  ADD CONSTRAINT "NWS_ContentProfile_IFContent_fkey" FOREIGN KEY ("IFContent")
    REFERENCES "NWS_Content" ("IDContent") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_ContentProfile_IFProfile_fkey" FOREIGN KEY ("IFProfile")
    REFERENCES "NWS_Profile" ("IFProfile") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_Profile"
  ADD CONSTRAINT "NWS_Profile_IFProfile_fkey" FOREIGN KEY ("IFProfile")
    REFERENCES "CRD_Profile" ("IDProfile") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_Profile_IFUser__Approved_fkey" FOREIGN KEY ("IFUser__Approved")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NWS_UserTag"
  ADD CONSTRAINT "NWS_UserTag_IFUser_fkey" FOREIGN KEY ("IFUser")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NWS_UserTag_IFTag_fkey" FOREIGN KEY ("IFTag")
    REFERENCES "NWS_Tag" ("IDTag") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "LOG_Logtype"
  ADD CONSTRAINT "LOG_Logtype_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "LOG_Logtype_IFLogtype_parent_fkey" FOREIGN KEY ("IFLogtype_parent")
    REFERENCES "LOG_Logtype" ("IDLogtype") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "LOG_Errortype"
  ADD CONSTRAINT "LOG_Errortype_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

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

ALTER TABLE "CRD_Permition"
  ADD CONSTRAINT "CRD_Permition_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NET_Defaultprofile"
  ADD CONSTRAINT "NET_Defaultprofile_IFProfile_fkey" FOREIGN KEY ("IFProfile")
    REFERENCES "CRD_Profile" ("IDProfile") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NET_BrowserUser"
  ADD CONSTRAINT "NET_BrowserUser_IFBrowser_fkey" FOREIGN KEY ("IFBrowser")
    REFERENCES "NET_Browser" ("IDBrowser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NET_BrowserUser_IFUser_fkey" FOREIGN KEY ("IFUser")
    REFERENCES "NET_User" ("IFUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "CRD_ProfileProfile"
  ADD CONSTRAINT "CRD_ProfileProfile_IFProfile_fkey" FOREIGN KEY ("IFProfile")
    REFERENCES "CRD_Profile" ("IDProfile") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "CRD_ProfileProfile_IFProfile_parent_fkey" FOREIGN KEY ("IFProfile_parent")
    REFERENCES "CRD_Profile" ("IDProfile") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "CRD_Profile"
  ADD CONSTRAINT "CRD_Profile_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "CRD_UserProfile"
  ADD CONSTRAINT "CRD_UserProfile_IFUser_fkey" FOREIGN KEY ("IFUser")
    REFERENCES "CRD_User" ("IDUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "CRD_UserProfile_IFProfile_fkey" FOREIGN KEY ("IFProfile")
    REFERENCES "CRD_Profile" ("IDProfile") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

ALTER TABLE "NET_User"
  ADD CONSTRAINT "NET_User_IFUser_fkey" FOREIGN KEY ("IFUser")
    REFERENCES "CRD_User" ("IDUser") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT "NET_User_IFApplication_fkey" FOREIGN KEY ("IFApplication")
    REFERENCES "APP_Application" ("IDApplication") MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
;

