﻿CREATE TABLE [dbo].[Sf_Opportunity] (
    [AccountId]                            VARCHAR (18)    NULL,
    [StageName]                            VARCHAR (40)    NOT NULL,
    [Amount]                               DECIMAL (18, 2) NULL,
    [Probability]                          REAL            NULL,
    [CloseDate]                            DATETIME        NOT NULL,
    [NextStep]                             VARCHAR (255)   NULL,
    [LeadSource]                           VARCHAR (40)    NULL,
    [IsClosed]                             BIT             NOT NULL,
    [IsWon]                                BIT             NOT NULL,
    [ForecastCategory]                     VARCHAR (40)    NOT NULL,
    [ForecastCategoryName]                 VARCHAR (40)    NULL,
    [CampaignId]                           VARCHAR (18)    NULL,
    [HasOpportunityLineItem]               BIT             NOT NULL,
    [Pricebook2Id]                         VARCHAR (18)    NULL,
    [FiscalQuarter]                        INT             NULL,
    [FiscalYear]                           INT             NULL,
    [Fiscal]                               VARCHAR (6)     NULL,
    [SyncedQuoteId]                        VARCHAR (18)    NULL,
    [HasOpenActivity]                      BIT             NOT NULL,
    [HasOverdueTask]                       BIT             NOT NULL,
    [DB_Competitor__c]                     VARCHAR (255)   NULL,
    [Final_Amount__c]                      DECIMAL (18, 2) NULL,
    [Limited_Time_Offer__c]                BIT             NOT NULL,
    [Buyer_s__c]                           VARCHAR (255)   NULL,
    [Closure_Reminder_Date__c]             DATETIME        NULL,
    [Customer_PO__c]                       VARCHAR (30)    NULL,
    [Direct_Shipment_Terms__c]             VARCHAR (4099)  NULL,
    [Expected_Ship_Date__c]                DATETIME        NULL,
    [Export_Rep__c]                        VARCHAR (30)    NULL,
    [Int_l_Sales_Rep__c]                   VARCHAR (18)    NULL,
    [Aged_Date_30_days_from_Close_date__c] DATETIME        NULL,
    [Main_Buyer_ID__c]                     VARCHAR (1300)  NULL,
    [Main_Buyer__c]                        VARCHAR (60)    NULL,
    [Rollup_Result_Field__c]               REAL            NULL,
    [Reminder_Date__c]                     DATETIME        NULL,
    [Roland_Order_Number__c]               VARCHAR (30)    NULL,
    [Destination_Port_Opp__c]              VARCHAR (100)   NULL,
    [Comments__c]                          VARCHAR (255)   NULL,
    [OppProduct_s__c]                      VARCHAR (255)   NULL,
    [True_Opp_Value__c]                    REAL            NULL,
    [Roland_Team_Member__c]                VARCHAR (18)    NULL,
    [Supplier_Engagement__c]               VARCHAR (4099)  NULL,
    [Lead_Source_Description__c]           VARCHAR (255)   NULL,
    [NewProdType__c]                       VARCHAR (255)   NULL,
    [NewProd__c]                           VARCHAR (255)   NULL,
    [NewProd_Notes__c]                     VARCHAR (255)   NULL,
    [Vendor_Number__c]                     VARCHAR (15)    NULL,
    [Recovery_Action__c]                   VARCHAR (2000)  NULL,
    [Support_needed_from__c]               VARCHAR (255)   NULL,
    [Recovery_Action_Last_Modified__c]     DATETIME        NULL,
    [Actual_Close_Date__c]                 DATETIME        NULL,
    [Recovery_Timeline__c]                 VARCHAR (255)   NULL,
    [Lost_Placement_Lookup__c]             VARCHAR (18)    NULL,
    [Roland_Team_Member_Name__c]           VARCHAR (1300)  NULL,
    [Sales_Rep_Name__c]                    VARCHAR (1300)  NULL,
    [Terms__c]                             VARCHAR (255)   NULL,
    [Buyer__c]                             VARCHAR (255)   NULL,
    [Id]                                   VARCHAR (18)    NOT NULL,
    [IsDeleted]                            BIT             NOT NULL,
    [Name]                                 VARCHAR (120)   NOT NULL,
    [Type]                                 VARCHAR (40)    NULL,
    [RecordTypeId]                         VARCHAR (18)    NULL,
    [Description]                          VARCHAR (8000)  NULL,
    [OwnerId]                              VARCHAR (18)    NOT NULL,
    [CreatedDate]                          DATETIME        NOT NULL,
    [CreatedById]                          VARCHAR (18)    NOT NULL,
    [LastModifiedDate]                     DATETIME        NOT NULL,
    [LastModifiedById]                     VARCHAR (18)    NOT NULL,
    [SystemModstamp]                       DATETIME        NOT NULL,
    [LastActivityDate]                     DATETIME        NULL,
    [LastViewedDate]                       DATETIME        NULL,
    [LastReferencedDate]                   DATETIME        NULL,
    [Price_Book__c]                        VARCHAR (1300)  NULL
);

