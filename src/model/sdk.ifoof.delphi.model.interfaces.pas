unit sdk.ifoof.delphi.model.interfaces;

interface

uses
  System.JSON,
  System.Generics.Collections,
  sdk.ifoof.delphi.model.enums;

type
  iJobsJson<T: IInterface> = interface
    function ToObject(Value: String): T;
    function ToJSON: TJSONObject;
  end;

  iSchemaUserCode = interface
    function UserCode: String; overload;
    function AuthorizationCodeVerifier: String; overload;
    function VerificationUrl: String; overload;
    function VerificationUrlComplete: String; overload;
    function ExpiresIn: TDateTime; overload;
  end;

  iSchemaToken = interface
    function AccessToken: String;
    function RefreshToken: String;
    function ExpiresIn: TDateTime;
  end;

  //Schemas Merchant

  iMerchantSummary = interface
    function Id(Value: String): iMerchantSummary; overload;
    function Id: String; overload;
    function Name(Value: String): iMerchantSummary; overload;
    function Name: String; overload;
    function CorporateName(Value: String): iMerchantSummary; overload;
    function CorporateName: String; overload;
    function &End: iMerchantSummary;
  end;

  iAddress<T: IInterface> = interface
    function Country(Value: String): iAddress<T>; overload;
    function Country: String; overload;
    function State(Value: String): iAddress<T>; overload;
    function State: String; overload;
    function City(Value: String): iAddress<T>; overload;
    function City: String; overload;
    function PostaCode(Value: String): iAddress<T>; overload;
    function PostalCode: String; overload;
    function District(Value: String): iAddress<T>; overload;
    function District: String; overload;
    function Street(Value: String): iAddress<T>; overload;
    function Street: String; overload;
    function Number(Value: String): iAddress<T>; overload;
    function Number: String; overload;
    function Latitude(Value: Double): iAddress<T>; overload;
    function Latitude: Double; overload;
    function Longitude(Value: Double): iAddress<T>; overload;
    function Longitude: Double; overload;
    function JSON: iJobsJson<iAddress<T>>;
    function &End: T;
  end;

  iSalesChannel<T: IInterface> = interface
    function Name(Value: TSaleChannelMerchant): iSalesChannel<T>; overload;
    function Name: TSaleChannelMerchant; overload;
    function Enabled(Value: String): iSalesChannel<T>; overload;
    function Enabled: String; overload;
    function &End: T;
  end;

  iOperation<T: IInterface> = interface
    function Name(Value: TOperationMerchant): iOperation<T>; overload;
    function Name: TOperationMerchant; overload;
    function SalesChannel: iSalesChannel<iOperation<T>>;
    function &End: T;
  end;

  iMerchant = interface
    function Id(Value: String): iMerchant; overload;
    function Id: String; overload;
    function Name(Value: String): iMerchant; overload;
    function Name: String; overload;
    function CorporateName(Value: String): iMerchant; overload;
    function CorporateName: String; overload;
    function Description(Value: String): iMerchant; overload;
    function Description: String; overload;
    function AverageTicket(Value: Integer): iMerchant; overload;
    function AverageTicket: Integer; overload;
    function Exclusive(Value: Boolean): iMerchant; overload;
    function Exclusive: Boolean; overload;
    function &Type(Value: TTypeMerchant): iMerchant; overload;
    function &Type: TTypeMerchant; overload;
    function Status(Value: TStatusMerchant): iMerchant; overload;
    function Status: TStatusMerchant; overload;
    function CreatedAt(Value: TDateTime): iMerchant; overload;
    function CreatedAt: TDateTime; overload;
    function Address: iAddress<iMerchant>;
    function Operations(Value: String): iMerchant; overload;
    function JSON: iJobsJson<iMerchant>;
    function &End: iMerchant;
  end;

  iInterruption = interface
    function Id(Value: String): iInterruption; overload;
    function Id: String; overload;
    function Description(Value: String): iInterruption; overload;
    function Description: String; overload;
    function DateStart(Value: TDateTime): iInterruption; overload;
    function DateStart: TDateTime; overload;
    function DateEnd(Value: TDateTime): iInterruption; overload;
    function DateEnd: TDateTime; overload;
    function Json: iJobsJson<iInterruption>;
    function &End: iInterruption;
  end;

  iReopenable<T: IInterface> = interface
    function Identifier(Value: String): iReopenable<T>; overload;
    function Identifier: String; overload;
    function &Type(Value: TTypeMerchant): iReopenable<T>; overload;
    function &Type: TTypeMerchant; overload;
    function Reopenable(Value: Boolean): iReopenable<T>; overload;
    function Reopenable: Boolean; overload;
    function JSON: iJobsJson<iReopenable<T>>;
    function &End: iReopenable<T>;
  end;

  iStatusMessage<T: IInterface> = interface
    function Title(Value: String): iStatusMessage<T>; overload;
    function Title: String; overload;
    function SubTitle(Value: String): iStatusMessage<T>; overload;
    function SubTitle: String; overload;
    function Description(Value: String): iStatusMessage<T>; overload;
    function Description: String; overload;
    function JSON: iJobsJson<iStatusMessage<T>>;
    function &End: T;
  end;

  iStatusValidations<T: IInterface> = interface
    function Id(Value: String): iStatusValidations<T>; overload;
    function Id: String; overload;
    function Code(Value: String): iStatusValidations<T>; overload;
    function Code: String; overload;
    function State(Value: TStatusMerchant): iStatusValidations<T>; overload;
    function State: TTypeMerchant; overload;
    function &Message: iStatusMessage<iStatusValidations<T>>;
  end;

  iStatus = interface
    function Operation(Value: String): iStatus; overload;
    function Operation: String; overload;
    function SalesOperation(Value: String): iStatus; overload;
    function SalesOperation: String; overload;
    function Available(Value: Boolean): iStatus; overload;
    function Available: Boolean; overload;
    function State(Value: TStatusMerchant): iStatus; overload;
    function State: TStatusMerchant; overload;
    function Reopenable: iReopenable<iStatus>;
    function Validations: iStatusValidations<iStatus>;
    function &End: iStatus;
  end;

  iError = interface
    function JSON: iJobsJson<iError>;
    function Code: String;
    function &Message: String;
  end;

  //Schemas Order

  iAckEvent = interface
    function Id(Value: String): iAckEvent; overload;
    function Id: String; overload;
    function &End: iAckEvent;
  end;

  iLiability<T: IInterface> = interface
    function Name(Value: String): iLiability<T>; overload;
    function Name: String; overload;
    function Percentage(Value: Double): iLiability<T>; overload;
    function Percentage: Double; overload;
    function &End: T;
  end;

  iAddtionalFee = interface
    function _Type(Value: String): iAddtionalFee; overload;
    function _Type: String; overload;
    function _Value(Value: String): iAddtionalFee; overload;
    function _Value: String; overload;
    function _Description(Value: String): iAddtionalFee; overload;
    function _Description: String; overload;
    function FullDescription(Value: String): iAddtionalFee; overload;
    function FullDescriptino: String; overload;
    function Liabilities: iLiability<iAddtionalFee>;
    function &End: iAddtionalFee;
  end;

  iSponsorship<T: IInterface> = interface
    function Name(Value: String): iSponsorship<T>; overload;
    function Name: String; overload;
    function _Value(Value: Double): iSponsorship<T>; overload;
    function _Value: Double; overload;
    function Description(Value: String): iSponsorship<T>; overload;
    function Description: String; overload;
    function &End: T;
  end;

  iBenefit = interface
    function TargetId(Value: String): iBenefit; overload;
    function TargetId: String; overload;
    function SponsorshipValues: iSponsorship<iBenefit>;
    function _Value(Value: Double): iBenefit; overload;
    function _Value: Double; overload;
    function Target(Value: String): iBenefit; overload;
    function Target: String; overload;
    function &End: iBenefit;
  end;

  iCancellationRequest = interface
    function Reason(Value: String): iCancellationRequest; overload;
    function Reason: String; overload;
    function CancellationCode(Value: String): iCancellationRequest; overload;
    function CancallationCode: String; overload;
    function &End: iCancellationRequest;
  end;

  iCancellationReasons = interface
    function Description(Value: String): iCancellationReasons; overload;
    function Description: String; overload;
    function CancelCodeId(Value: String): iCancellationReasons; overload;
    function CancelCodeId: String; overload;
    function &End: iCancellationReasons;
  end;

  iCancellationReason = interface
    function Description(Value: String): iCancellationReason; overload;
    function Descrition: String; overload;
    function CancelCodeId(Value: String): iCancellationReason; overload;
    function CancelaCodeId: String; overload;
    function &End: iCancellationReason;
  end;

  iChangePreparationTimeRequest = interface
    function ChangePreparationTimeInSeconds(Value: Integer): iChangePreparationTimeRequest; overload;
    function ChangePreparationTimeInSeconds: Integer; overload;
    function Reason(Value: String): iChangePreparationTimeRequest; overload;
    function Reason: String; overload;
    function &End: iChangePreparationTimeRequest;
  end;

  iCashInformation = interface
    function ChangeFor(Value: Integer): iCashInformation; overload;
    function ChangeFor: Integer; overload;
    function &End: iCashInformation;
  end;

  iCommonOrderDetails = interface
    function Benefits: iBenefit;
    function &End: iCommonOrderDetails;
  end;

implementation

end.
