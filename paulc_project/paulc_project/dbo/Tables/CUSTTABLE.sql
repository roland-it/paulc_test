﻿CREATE TABLE [dbo].[CUSTTABLE] (
    [ACCOUNTNUM]                         NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [INVOICEACCOUNT]                     NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [CUSTGROUP]                          NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [LINEDISC]                           NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [PAYMTERMID]                         NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CASHDISC]                           NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CURRENCY]                           NVARCHAR (3)     DEFAULT ('') NOT NULL,
    [INTERCOMPANYAUTOCREATEORDERS]       INT              DEFAULT ((0)) NOT NULL,
    [SALESGROUP]                         NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [BLOCKED]                            INT              DEFAULT ((0)) NOT NULL,
    [ONETIMECUSTOMER]                    INT              DEFAULT ((0)) NOT NULL,
    [ACCOUNTSTATEMENT]                   INT              DEFAULT ((0)) NOT NULL,
    [CREDITMAX]                          NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [MANDATORYCREDITLIMIT]               INT              DEFAULT ((0)) NOT NULL,
    [VENDACCOUNT]                        NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [PRICEGROUP]                         NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [MULTILINEDISC]                      NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ENDDISC]                            NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [VATNUM]                             NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [INVENTLOCATION]                     NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [DLVTERM]                            NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [DLVMODE]                            NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [MARKUPGROUP]                        NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CLEARINGPERIOD]                     NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [FREIGHTZONE]                        NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CREDITRATING]                       NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [TAXGROUP]                           NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [STATISTICSGROUP]                    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [PAYMMODE]                           NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [COMMISSIONGROUP]                    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [BANKACCOUNT]                        NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [PAYMSCHED]                          NVARCHAR (30)    DEFAULT ('') NOT NULL,
    [CONTACTPERSONID]                    NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [INVOICEADDRESS]                     INT              DEFAULT ((0)) NOT NULL,
    [OURACCOUNTNUM]                      NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [SALESPOOLID]                        NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [INCLTAX]                            INT              DEFAULT ((0)) NOT NULL,
    [CUSTITEMGROUPID]                    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [NUMBERSEQUENCEGROUP]                NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [PAYMDAYID]                          NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [LINEOFBUSINESSID]                   NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [DESTINATIONCODEID]                  NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [GIROTYPE]                           INT              DEFAULT ((0)) NOT NULL,
    [SUPPITEMGROUPID]                    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [GIROTYPEINTERESTNOTE]               INT              DEFAULT ((0)) NOT NULL,
    [TAXLICENSENUM]                      NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [WEBSALESORDERDISPLAY]               INT              DEFAULT ((0)) NOT NULL,
    [PAYMSPEC]                           NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [BANKCENTRALBANKPURPOSETEXT]         NVARCHAR (140)   DEFAULT ('') NOT NULL,
    [BANKCENTRALBANKPURPOSECODE]         NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [INTERCOMPANYALLOWINDIRECTCREATION]  INT              DEFAULT ((0)) NOT NULL,
    [PACKMATERIALFEELICENSENUM]          NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [TAXBORDERNUMBER_FI]                 NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [EINVOICEEANNUM]                     NVARCHAR (13)    DEFAULT ('') NOT NULL,
    [FISCALCODE]                         NVARCHAR (16)    DEFAULT ('') NOT NULL,
    [DLVREASON]                          NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [FORECASTDMPINCLUDE]                 INT              DEFAULT ((0)) NOT NULL,
    [GIROTYPECOLLECTIONLETTER]           INT              DEFAULT ((0)) NOT NULL,
    [SALESCALENDARID]                    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CUSTCLASSIFICATIONID]               NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [INTERCOMPANYDIRECTDELIVERY]         INT              DEFAULT ((0)) NOT NULL,
    [ENTERPRISENUMBER]                   NVARCHAR (50)    DEFAULT ('') NOT NULL,
    [SHIPCARRIERACCOUNT]                 NVARCHAR (25)    DEFAULT ('') NOT NULL,
    [GIROTYPEPROJINVOICE]                INT              DEFAULT ((0)) NOT NULL,
    [INVENTSITEID]                       NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ORDERENTRYDEADLINEGROUPID]          NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [SHIPCARRIERID]                      NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [SHIPCARRIERFUELSURCHARGE]           INT              DEFAULT ((0)) NOT NULL,
    [SHIPCARRIERBLINDSHIPMENT]           INT              DEFAULT ((0)) NOT NULL,
    [SHIPCARRIERACCOUNTCODE]             NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [GIROTYPEFREETEXTINVOICE]            INT              DEFAULT ((0)) NOT NULL,
    [SYNCENTITYID]                       UNIQUEIDENTIFIER DEFAULT ('{00000000-0000-0000-0000-000000000000}') NOT NULL,
    [SYNCVERSION]                        BIGINT           DEFAULT ((0)) NOT NULL,
    [MEMO]                               NVARCHAR (MAX)   DEFAULT (NULL) NULL,
    [SALESDISTRICTID]                    NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [SEGMENTID]                          NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [SUBSEGMENTID]                       NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [RFIDITEMTAGGING]                    INT              DEFAULT ((0)) NOT NULL,
    [RFIDCASETAGGING]                    INT              DEFAULT ((0)) NOT NULL,
    [RFIDPALLETTAGGING]                  INT              DEFAULT ((0)) NOT NULL,
    [COMPANYCHAINID]                     NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [COMPANYIDSIRET]                     NVARCHAR (14)    DEFAULT ('') NOT NULL,
    [PARTY]                              BIGINT           DEFAULT ((0)) NOT NULL,
    [IDENTIFICATIONNUMBER]               NVARCHAR (50)    DEFAULT ('') NOT NULL,
    [PARTYCOUNTRY]                       NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [PARTYSTATE]                         NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ORGID]                              NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [PAYMIDTYPE]                         NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [FACTORINGACCOUNT]                   NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [DEFAULTDIMENSION]                   BIGINT           DEFAULT ((0)) NOT NULL,
    [CUSTEXCLUDECOLLECTIONFEE]           INT              DEFAULT ((0)) NOT NULL,
    [CUSTEXCLUDEINTERESTCHARGES]         INT              DEFAULT ((0)) NOT NULL,
    [COMPANYNAFCODE]                     BIGINT           DEFAULT ((0)) NOT NULL,
    [BANKCUSTPAYMIDTABLE]                BIGINT           DEFAULT ((0)) NOT NULL,
    [GIROTYPEACCOUNTSTATEMENT]           INT              DEFAULT ((0)) NOT NULL,
    [MAINCONTACTWORKER]                  BIGINT           DEFAULT ((0)) NOT NULL,
    [CREDITCARDADDRESSVERIFICATION]      INT              DEFAULT ((0)) NOT NULL,
    [CREDITCARDCVC]                      INT              DEFAULT ((0)) NOT NULL,
    [CREDITCARDADDRESSVERIFICATIONVOID]  INT              DEFAULT ((0)) NOT NULL,
    [CREDITCARDADDRESSVERIFICATIONLEVEL] INT              DEFAULT ((0)) NOT NULL,
    [COMPANYTYPE_MX]                     INT              DEFAULT ((0)) NOT NULL,
    [RFC_MX]                             NVARCHAR (13)    DEFAULT ('') NOT NULL,
    [CURP_MX]                            NVARCHAR (18)    DEFAULT ('') NOT NULL,
    [STATEINSCRIPTION_MX]                NVARCHAR (30)    DEFAULT ('') NOT NULL,
    [RESIDENCEFOREIGNCOUNTRYREGIONID_IT] NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [BIRTHCOUNTYCODE_IT]                 NVARCHAR (2)     DEFAULT ('') NOT NULL,
    [BIRTHDATE_IT]                       DATETIME         DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [BIRTHPLACE_IT]                      NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [EINVOICE]                           INT              DEFAULT ((0)) NOT NULL,
    [EINVOICEREGISTER_IT]                INT              DEFAULT ((0)) NOT NULL,
    [CCMNUM_BR]                          NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [CNPJCPFNUM_BR]                      NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [PBACUSTGROUPID]                     NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [IENUM_BR]                           NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [SUFRAMANUMBER_BR]                   NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [SUFRAMA_BR]                         INT              DEFAULT ((0)) NOT NULL,
    [CUSTFINALUSER_BR]                   INT              DEFAULT ((0)) NOT NULL,
    [INTERESTCODE_BR]                    NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [FINECODE_BR]                        NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [SUFRAMAPISCOFINS_BR]                INT              DEFAULT ((0)) NOT NULL,
    [TAXWITHHOLDCALCULATE_TH]            INT              DEFAULT ((0)) NOT NULL,
    [TAXWITHHOLDGROUP_TH]                NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [CONSDAY_JP]                         INT              DEFAULT ((0)) NOT NULL,
    [NIT_BR]                             NVARCHAR (14)    DEFAULT ('') NOT NULL,
    [INSSCEI_BR]                         NVARCHAR (15)    DEFAULT ('') NOT NULL,
    [CNAE_BR]                            NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ICMSCONTRIBUTOR_BR]                 INT              DEFAULT ((0)) NOT NULL,
    [SERVICECODEONDLVADDRESS_BR]         INT              DEFAULT ((0)) NOT NULL,
    [INVENTPROFILETYPE_RU]               INT              DEFAULT ((0)) NOT NULL,
    [INVENTPROFILEID_RU]                 NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [TAXWITHHOLDCALCULATE_IN]            INT              DEFAULT ((0)) NOT NULL,
    [UNITEDVATINVOICE_LT]                INT              DEFAULT ((0)) NOT NULL,
    [FOREIGNERID_BR]                     NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [ENTERPRISECODE]                     NVARCHAR (50)    DEFAULT ('') NOT NULL,
    [COMMERCIALREGISTERSECTION]          NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [COMMERCIALREGISTERINSETNUMBER]      NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [COMMERCIALREGISTER]                 NVARCHAR (40)    DEFAULT ('') NOT NULL,
    [REGNUM_W]                           NVARCHAR (25)    DEFAULT ('') NOT NULL,
    [ISRESIDENT_LV]                      INT              DEFAULT ((0)) NOT NULL,
    [INTBANK_LV]                         NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [PAYMENTREFERENCE_EE]                NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [PACKAGEDEPOSITEXCEMPT_PL]           INT              DEFAULT ((0)) NOT NULL,
    [FEDNONFEDINDICATOR]                 INT              DEFAULT ((0)) NOT NULL,
    [IRS1099CINDICATOR]                  INT              DEFAULT ((0)) NOT NULL,
    [AGENCYLOCATIONCODE]                 NVARCHAR (12)    DEFAULT ('') NOT NULL,
    [FEDERALCOMMENTS]                    NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [USEPURCHREQUEST]                    INT              DEFAULT ((0)) NOT NULL,
    [MCRMERGEDPARENT]                    NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [MCRMERGEDROOT]                      NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [AFFILIATED_RU]                      INT              DEFAULT ((0)) NOT NULL,
    [CASHDISCBASEDAYS]                   INT              DEFAULT ((0)) NOT NULL,
    [CUSTTRADINGPARTNERCODE]             BIGINT           DEFAULT ((0)) NOT NULL,
    [CUSTWHTCONTRIBUTIONTYPE_BR]         INT              DEFAULT ((0)) NOT NULL,
    [DAXINTEGRATIONID]                   UNIQUEIDENTIFIER DEFAULT ('{00000000-0000-0000-0000-000000000000}') NOT NULL,
    [DEFAULTDIRECTDEBITMANDATE]          BIGINT           DEFAULT ((0)) NOT NULL,
    [DEFAULTINVENTSTATUSID]              NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [ENTRYCERTIFICATEREQUIRED_W]         INT              DEFAULT ((0)) NOT NULL,
    [EXPORTSALES_PL]                     INT              DEFAULT ((0)) NOT NULL,
    [EXPRESSBILLOFLADING]                INT              DEFAULT ((0)) NOT NULL,
    [FISCALDOCTYPE_PL]                   INT              DEFAULT ((0)) NOT NULL,
    [FOREIGNRESIDENT_RU]                 INT              DEFAULT ((0)) NOT NULL,
    [GENERATEINCOMINGFISCALDOCUMENT_BR]  INT              DEFAULT ((0)) NOT NULL,
    [INVOICEPOSTINGTYPE_RU]              INT              DEFAULT ((0)) NOT NULL,
    [ISSUEOWNENTRYCERTIFICATE_W]         INT              DEFAULT ((0)) NOT NULL,
    [ISSUERCOUNTRY_HU]                   NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [LVPAYMTRANSCODES]                   BIGINT           DEFAULT ((0)) NOT NULL,
    [MANDATORYVATDATE_PL]                INT              DEFAULT ((0)) NOT NULL,
    [PASSPORTNO_HU]                      NVARCHAR (13)    DEFAULT ('') NOT NULL,
    [PDSCUSTREBATEGROUPID]               NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [PDSFREIGHTACCRUED]                  INT              DEFAULT ((0)) NOT NULL,
    [PDSREBATETMAGROUP]                  NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [TAXPERIODPAYMENTCODE_PL]            NVARCHAR (10)    DEFAULT ('') NOT NULL,
    [USECASHDISC]                        INT              DEFAULT ((0)) NOT NULL,
    [AUTHORITYOFFICE_IT]                 NVARCHAR (6)     DEFAULT ('') NOT NULL,
    [FOREIGNTAXREGISTRATION_MX]          NVARCHAR (40)    DEFAULT ('') NOT NULL,
    [PRESENCETYPE_BR]                    INT              DEFAULT ((0)) NOT NULL,
    [TAXGSTRELIEFGROUPHEADING_MY]        BIGINT           DEFAULT ((0)) NOT NULL,
    [MODIFIEDDATETIME]                   DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [DEL_MODIFIEDTIME]                   INT              DEFAULT ((0)) NOT NULL,
    [MODIFIEDBY]                         NVARCHAR (8)     DEFAULT ('?') NOT NULL,
    [CREATEDDATETIME]                    DATETIME         DEFAULT (dateadd(millisecond, -datepart(millisecond,getutcdate()),getutcdate())) NOT NULL,
    [DEL_CREATEDTIME]                    INT              DEFAULT ((0)) NOT NULL,
    [DATAAREAID]                         NVARCHAR (4)     DEFAULT ('dat') NOT NULL,
    [RECVERSION]                         INT              DEFAULT ((1)) NOT NULL,
    [PARTITION]                          BIGINT           DEFAULT ((5637144576.)) NOT NULL,
    [RECID]                              BIGINT           NOT NULL,
    [VSIRECCOUNT]                        BIGINT           DEFAULT ((0)) NOT NULL,
    [ROLCLOSEDDATE]                      DATETIME         DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [ROLCREDITCOMMENTS]                  NVARCHAR (140)   DEFAULT ('') NOT NULL,
    [ROLCREDITINSURANCE]                 INT              DEFAULT ((0)) NOT NULL,
    [ROLCREDITREPRESENTATIVE]            BIGINT           DEFAULT ((0)) NOT NULL,
    [ROLCWTADDON]                        NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ROLINACTIVEREASONCODE]              NVARCHAR (20)    DEFAULT ('') NOT NULL,
    [ROLINSIDEACCOUNTMANAGER]            BIGINT           DEFAULT ((0)) NOT NULL,
    [ROLLASTCREDITCHECKDATE]             DATETIME         DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [ROLPERCENTADDON]                    NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ROLPERCSADDON]                      NUMERIC (32, 16) DEFAULT ((0)) NOT NULL,
    [ROLPREVIOUSNAME]                    NVARCHAR (60)    DEFAULT ('') NOT NULL,
    [ROLALWAYSHOLDSO]                    INT              DEFAULT ((0)) NOT NULL,
    [RFLL_CUSTOMERSINCE]                 DATETIME         DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [RFLL_CUSTOMERSINCETZID]             INT              DEFAULT ((37001)) NOT NULL,
    [ROLWMSDONATION]                     INT              DEFAULT ((0)) NOT NULL,
    [RFLI_DEFAULTORDERTYPE]              INT              DEFAULT ((0)) NOT NULL,
    [RFLI_EDIACKNOWLEDGMENT]             INT              DEFAULT ((0)) NOT NULL,
    [RFLI_EDICUSTOMERINVOICE]            INT              DEFAULT ((0)) NOT NULL,
    [RFLI_EDICUSTOMERORDER]              INT              DEFAULT ((0)) NOT NULL,
    [RFLI_EDIDUNSNUMBER]                 NVARCHAR (50)    DEFAULT ('') NOT NULL,
    [RFLI_TRADINGPARTNERID]              NVARCHAR (40)    DEFAULT ('') NOT NULL,
    [RFLI_EDIASN]                        INT              DEFAULT ((0)) NOT NULL,
    [RSMCOLLECTIONSREP]                  BIGINT           DEFAULT ((0)) NOT NULL,
    [SALESFORCEACCOUNTNUMBER]            NVARCHAR (30)    DEFAULT ('') NOT NULL,
    [ROLCHANNELMANAGER]                  BIGINT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [I_077ACCOUNTIDX] PRIMARY KEY CLUSTERED ([PARTITION] ASC, [DATAAREAID] ASC, [ACCOUNTNUM] ASC),
    CHECK ([RECID]<>(0))
);

