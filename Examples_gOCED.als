module Examples_gOCED

open MetaModel_gOCED_Try01

// one sig StudentType, ProfessorType, SupervisionType extends EndurantType {}
// one sig AssignSupervisor extends EventType {}
// one sig S, M, D extends Object {}
// one sig SupervisionSM, SupervisionSD extends Relator {}
// one sig e1, e2 extends AtomicEvent {}
// one sig Time1, Time2 extends Time {}

// pred supervisor_scenario1 {
//     S.OfEndurantType = StudentType
//     M.OfEndurantType = ProfessorType
//     D.OfEndurantType = ProfessorType

//     SupervisionSM.OfEndurantType = SupervisionType
//     SupervisionSD.OfEndurantType = SupervisionType

//     SupervisionSM.mediates = S + M
//     SupervisionSD.mediates = S + D

//     e1.OfEventType = AssignSupervisor
//     e2.OfEventType = AssignSupervisor

//     e1.beginAt = Time1
//     no e1.endAt

//     e2.beginAt = Time2
//     no e2.endAt

//     S.participatedIn = e1 + e2
//     M.participatedIn = e1
//     D.participatedIn = e2

//     SupervisionSM.wasCreatedIn = e1
//     SupervisionSM.wasTerminatedIn = e2
//     no SupervisionSM.participatedIn

//     SupervisionSD.wasCreatedIn = e2
//     no SupervisionSD.wasTerminatedIn
//     no SupervisionSD.participatedIn

//     no S.wasCreatedIn
//     no M.wasCreatedIn
//     no D.wasCreatedIn

//     no S.wasTerminatedIn
//     no M.wasTerminatedIn
//     no D.wasTerminatedIn

//     no QVAS
//     no Quality
//     no QualityValue
//     no QualityType
//     no ComplexEvent

//     Event = e1 + e2
//     AtomicEvent = e1 + e2
//     Time = Time1 + Time2

//     Endurant = S + M + D + SupervisionSM + SupervisionSD
//     Object = S + M + D
//     Relator = SupervisionSM + SupervisionSD

//     EventType = AssignSupervisor
//     EndurantType = StudentType + ProfessorType + SupervisionType
// }

// run supervisor_scenario1 for 8

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

// pred supervisor_scenario2 {
//     S.OfEndurantType = StudentType
//     M.OfEndurantType = ProfessorType
//     D.OfEndurantType = ProfessorType

//     SupervisionSM.OfEndurantType = SupervisionType
//     SupervisionSD.OfEndurantType = SupervisionType

//     SupervisionSM.mediates = S + M
//     SupervisionSD.mediates = S + D

//     e1.OfEventType = AssignSupervisor
//     e2.OfEventType = AssignSupervisor

//     e1.beginAt = Time1
//     no e1.endAt

//     e2.beginAt = Time2
//     no e2.endAt

//     S.participatedIn = e1 + e2
//     M.participatedIn = e1
//     D.participatedIn = e2

//     SupervisionSM.wasCreatedIn = e1
//     no SupervisionSM.wasTerminatedIn
//     no SupervisionSM.participatedIn

//     SupervisionSD.wasCreatedIn = e2
//     no SupervisionSD.wasTerminatedIn
//     no SupervisionSD.participatedIn

//     no S.wasCreatedIn
//     no M.wasCreatedIn
//     no D.wasCreatedIn

//     no S.wasTerminatedIn
//     no M.wasTerminatedIn
//     no D.wasTerminatedIn

//     no QVAS
//     no Quality
//     no QualityValue
//     no QualityType
//     no ComplexEvent

//     Event = e1 + e2
//     AtomicEvent = e1 + e2
//     Time = Time1 + Time2

//     Endurant = S + M + D + SupervisionSM + SupervisionSD
//     Object = S + M + D
//     Relator = SupervisionSM + SupervisionSD

//     EventType = AssignSupervisor
//     EndurantType = StudentType + ProfessorType + SupervisionType
// }

// run supervisor_scenario2 for 8

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

// one sig SupervisionSM, SupervisionSMD extends Relator {}
// pred supervisor_scenario2_b {
//     S.OfEndurantType = StudentType
//     M.OfEndurantType = ProfessorType
//     D.OfEndurantType = ProfessorType

//     SupervisionSM.OfEndurantType = SupervisionType
//     SupervisionSMD.OfEndurantType = SupervisionType

//     SupervisionSM.mediates = S + M
//     SupervisionSMD.mediates = S + M + D

//     e1.OfEventType = AssignSupervisor
//     e2.OfEventType = AssignSupervisor

//     e1.beginAt = Time1
//     no e1.endAt

//     e2.beginAt = Time2
//     no e2.endAt

//     S.participatedIn = e1 + e2
//     M.participatedIn = e1 + e2
//     D.participatedIn = e2

//     SupervisionSM.wasCreatedIn = e1
//     SupervisionSM.wasTerminatedIn = e2
//     no SupervisionSM.participatedIn

//     SupervisionSMD.wasCreatedIn = e2
//     no SupervisionSMD.wasTerminatedIn
//     no SupervisionSMD.participatedIn

//     no S.wasCreatedIn
//     no M.wasCreatedIn
//     no D.wasCreatedIn

//     no S.wasTerminatedIn
//     no M.wasTerminatedIn
//     no D.wasTerminatedIn

//     no QVAS
//     no Quality
//     no QualityValue
//     no QualityType
//     no ComplexEvent

//     Event = e1 + e2
//     AtomicEvent = e1 + e2
//     Time = Time1 + Time2

//     Endurant = S + M + D + SupervisionSM + SupervisionSMD
//     Object = S + M + D
//     Relator = SupervisionSM + SupervisionSMD

//     EventType = AssignSupervisor
//     EndurantType = StudentType + ProfessorType + SupervisionType
// }

// run supervisor_scenario2_b for 8

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

//  one sig POType, InvoiceType, InvoiceLineItemType extends ObjectType {}
//  one sig ChildOfRelatorType, InvoicePORelatorType extends RelatorType {}
//  one sig ReleaseStatusQT, PaymentBlockQT extends QualityType {}
//  one sig CreatePO, ReleasePO, IssueInvoice extends EventType {}
//  one sig PO_1, IV_1, ILI_1 extends Object {}
//  one sig ChildOfRelation, InvoicePORelation extends Relator {}
//  one sig e_1, e_2, e_3 extends AtomicEvent {}
//  one sig Time1, Time2, Time3 extends Time {}
//  one sig NonReleased, Released, Active extends QualityValue {}
//  one sig POStatusNonReleased, POStatusReleased, InvoicePaymentBlockActive extends QVAS {}

//  pred po_scenario1 {
//      PO_1.instanceOfOT = POType
//      IV_1.instanceOfOT = InvoiceType
//      ILI_1.instanceOfOT = InvoiceLineItemType

//      ChildOfRelation.instanceOfRT = ChildOfRelatorType
//      InvoicePORelation.instanceOfRT = InvoicePORelatorType

//      ChildOfRelation.mediates = ILI_1 + IV_1
//      InvoicePORelation.mediates = IV_1 + PO_1

//      e_1.OfEventType = CreatePO
//      e_2.OfEventType = ReleasePO
//      e_3.OfEventType = IssueInvoice

//      e_1.beginAt = Time1
//      no e_1.endAt

//      e_2.beginAt = Time2
//      no e_2.endAt

//      e_3.beginAt = Time3
//      no e_3.endAt

//      PO_1.wasCreatedIn = e_1
//      no PO_1.wasTerminatedIn
//      PO_1.participatedIn = e_2 + e_3

//      IV_1.wasCreatedIn = e_3
//      no IV_1.wasTerminatedIn
//      no IV_1.participatedIn

//      ILI_1.wasCreatedIn = e_3
//      no ILI_1.wasTerminatedIn
//      no ILI_1.participatedIn

//      ChildOfRelation.wasCreatedIn = e_3
//      no ChildOfRelation.wasTerminatedIn
//      no ChildOfRelation.participatedIn

//      InvoicePORelation.wasCreatedIn = e_3
//      no InvoicePORelation.wasTerminatedIn
//      no InvoicePORelation.participatedIn

//      POStatusNonReleased.concernsQT = ReleaseStatusQT
//      POStatusNonReleased.qvasHasQV = NonReleased
//      POStatusNonReleased.standsIn = PO_1
//      POStatusNonReleased.beginAt = Time1
//      POStatusNonReleased.endAt = Time2

//      POStatusReleased.concernsQT = ReleaseStatusQT
//      POStatusReleased.qvasHasQV = Released
//      POStatusReleased.standsIn = PO_1
//      POStatusReleased.beginAt = Time2
//      no POStatusReleased.endAt

//      InvoicePaymentBlockActive.concernsQT = PaymentBlockQT
//     InvoicePaymentBlockActive.qvasHasQV = Active
//     InvoicePaymentBlockActive.standsIn = IV_1
//     InvoicePaymentBlockActive.beginAt = Time3
//     no InvoicePaymentBlockActive.endAt

//     e_1.broughtAbout = POStatusNonReleased
//     e_2.broughtAbout = POStatusReleased
//     e_3.broughtAbout = InvoicePaymentBlockActive

//     no POStatusNonReleased.contributeToTrigger
//     no POStatusReleased.contributeToTrigger
//     no InvoicePaymentBlockActive.contributeToTrigger

//     e_1.historicallyDependsOn = none
//     e_2.historicallyDependsOn = e_1
//     e_3.historicallyDependsOn = e_1 + e_2

//     no Quality
//     no ComplexEvent

//     Object = PO_1 + IV_1 + ILI_1
//     Relator = ChildOfRelation + InvoicePORelation
//     Endurant = PO_1 + IV_1 + ILI_1 + ChildOfRelation + InvoicePORelation

//     Event = e_1 + e_2 + e_3
//     AtomicEvent = e_1 + e_2 + e_3

//     QVAS = POStatusNonReleased + POStatusReleased + InvoicePaymentBlockActive

//     Time = Time1 + Time2 + Time3

//     EventType = CreatePO + ReleasePO + IssueInvoice
//     ObjectType = POType + InvoiceType + InvoiceLineItemType
//     RelatorType = ChildOfRelatorType + InvoicePORelatorType
//     QualityType = ReleaseStatusQT + PaymentBlockQT

//     QualityValue = NonReleased + Released + Active
// }

// run po_scenario1

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


// one sig Requisition, Order, Invoice, Payment extends ObjectType {}
// one sig Settlement extends RelatorType {}
// one sig CreateR, ApproveR, CreateO, ChangeOQuantity,
//         InsertInvoice, InsertPayment extends EventType {}

// one sig Quantity, ApprovalStatus extends QualityType {}
// one sig Q100, Q500, Q600, Approved extends QualityValue {}
// one sig Re_1, O_1, In_1, In_2, P_1, P_2 extends Object {}
// one sig S_1, S_2 extends Relator {}
// one sig e_1, e_2, e_3, e_4, e_5, e_6, e_7, e_8 extends AtomicEvent {}
// one sig Time1, Time2, Time3, Time4, Time5, Time6, Time7, Time8 extends Time {}
// one sig Re_Q500, Re_Approved,
//         O_Q500, O_Q600,
//         In1_Q500, In2_Q100 extends QVAS {}

// pred exampleFromWillPaper_normal_gOCED {

//     // Object typing
//     Re_1.instanceOfOT = Requisition
//     O_1.instanceOfOT = Order
//     In_1.instanceOfOT = Invoice
//     In_2.instanceOfOT = Invoice
//     P_1.instanceOfOT = Payment
//     P_2.instanceOfOT = Payment

//      // Event typing
//     e_1.OfEventType = CreateR
//     e_2.OfEventType = ApproveR
//     e_3.OfEventType = CreateO
//     e_4.OfEventType = ChangeOQuantity
//     e_5.OfEventType = InsertInvoice
//     e_6.OfEventType = InsertInvoice
//     e_7.OfEventType = InsertPayment
//     e_8.OfEventType = InsertPayment

// //     // Event times
//     e_1.beginAt = Time1
//     e_2.beginAt = Time2
//     e_3.beginAt = Time3
//     e_4.beginAt = Time4
//     e_5.beginAt = Time5
//     e_6.beginAt = Time6
//     e_7.beginAt = Time7
//     e_8.beginAt = Time8

//     // Object creation and participation
//     Re_1.wasCreatedIn = e_1
//     Re_1.participatedIn = e_2 + e_3
//     no Re_1.wasTerminatedIn

//     O_1.wasCreatedIn = e_3
//     O_1.participatedIn = e_4 + e_5 + e_6 + e_7 + e_8
//     no O_1.wasTerminatedIn

//     In_1.wasCreatedIn = e_5
//     In_1.participatedIn = e_7
//     no In_1.wasTerminatedIn

//     In_2.wasCreatedIn = e_6
//     In_2.participatedIn = e_8
//     no In_2.wasTerminatedIn

//     P_1.wasCreatedIn = e_7
//     no P_1.participatedIn
//     no P_1.wasTerminatedIn

//     P_2.wasCreatedIn = e_8
//     no P_2.participatedIn
//     no P_2.wasTerminatedIn

//     // Object existence times
//     Re_1.beginAt = Time1
//     O_1.beginAt = Time3
//     In_1.beginAt = Time5
//     In_2.beginAt = Time6
//     P_1.beginAt = Time7
//     P_2.beginAt = Time8

//     no Object.endAt

//     // Settlement relators
//     S_1.instanceOfRT = Settlement
//     S_2.instanceOfRT = Settlement

//     S_1.mediates = O_1 + In_1 + P_1
//     S_2.mediates = O_1 + In_2 + P_2

//     S_1.wasCreatedIn = e_7
//     S_2.wasCreatedIn = e_8

//     no S_1.participatedIn
//     no S_2.participatedIn

//     no S_1.wasTerminatedIn
//     no S_2.wasTerminatedIn

//     S_1.beginAt = Time7
//     S_2.beginAt = Time8

//     no Relator.endAt

//     // Requisition quantity: 500 cows
//     Re_Q500.concernsQT = Quantity
//     Re_Q500.qvasHasQV = Q500
//     Re_Q500.standsIn = Re_1
//     Re_Q500.beginAt = Time1
//     no Re_Q500.endAt

//       // Requisition approval state
//     Re_Approved.concernsQT = ApprovalStatus
//     Re_Approved.qvasHasQV = Approved
//     Re_Approved.standsIn = Re_1
//     Re_Approved.beginAt = Time2
//     no Re_Approved.endAt

//     // Order quantity: 500, then 600
//     O_Q500.concernsQT = Quantity
//     O_Q500.qvasHasQV = Q500
//     O_Q500.standsIn = O_1
//     O_Q500.beginAt = Time3
//     O_Q500.endAt = Time4

//     O_Q600.concernsQT = Quantity
//     O_Q600.qvasHasQV = Q600
//     O_Q600.standsIn = O_1
//     O_Q600.beginAt = Time4
//     no O_Q600.endAt

//     // Invoice quantities
//     In1_Q500.concernsQT = Quantity
//     In1_Q500.qvasHasQV = Q500
//     In1_Q500.standsIn = In_1
//     In1_Q500.beginAt = Time5
//     no In1_Q500.endAt

//     In2_Q100.concernsQT = Quantity
//     In2_Q100.qvasHasQV = Q100
//     In2_Q100.standsIn = In_2
//     In2_Q100.beginAt = Time6
//     no In2_Q100.endAt

//     // Events bringing about QVAS
//     e_1.broughtAbout = Re_Q500
//     e_2.broughtAbout = Re_Approved
//     e_3.broughtAbout = O_Q500
//     e_4.broughtAbout = O_Q600
//     e_5.broughtAbout = In1_Q500
//     e_6.broughtAbout = In2_Q100
//     no e_7.broughtAbout
//     no e_8.broughtAbout

//     // Approval triggers order creation
//     Re_Approved.contributeToTrigger = e_3

//     no Re_Q500.contributeToTrigger
//     no O_Q500.contributeToTrigger
//     no O_Q600.contributeToTrigger
//     no In1_Q500.contributeToTrigger
//     no In2_Q100.contributeToTrigger

//     no e_1.historicallyDependsOn
//     e_2.historicallyDependsOn = e_1
//     e_3.historicallyDependsOn = e_2
//     e_4.historicallyDependsOn = e_3
//     e_5.historicallyDependsOn = e_4
//     e_6.historicallyDependsOn = e_4
//     e_7.historicallyDependsOn = e_5
//     e_8.historicallyDependsOn = e_6

//     no Event.properPartOf
//     no ComplexEvent

//     no Quality

//     Object = Re_1 + O_1 + In_1 + In_2 + P_1 + P_2

//     Relator = S_1 + S_2

//     Endurant = Re_1 + O_1 + In_1 + In_2 + P_1 + P_2 + S_1 + S_2

//     AtomicEvent = e_1 + e_2 + e_3 + e_4 + e_5 + e_6 + e_7 + e_8

//     Event = e_1 + e_2 + e_3 + e_4 + e_5 + e_6 + e_7 + e_8

//     Time = Time1 + Time2 + Time3 + Time4 + Time5 + Time6 + Time7 + Time8

//     ObjectType = Requisition + Order + Invoice + Payment

//     RelatorType = Settlement

//     EventType = CreateR + ApproveR + CreateO + ChangeOQuantity + InsertInvoice + InsertPayment

//     QualityType = Quantity + ApprovalStatus

//     QualityValue = Q100 + Q500 + Q600 + Approved

//     QVAS = Re_Q500 + Re_Approved + O_Q500 + O_Q600 + In1_Q500 + In2_Q100
// }

// run exampleFromWillPaper_normal_gOCED

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

one sig RequisitionType, OrderType, InvoiceType, PaymentType extends ObjectType {}

one sig SettlementType extends RelatorType {}

one sig CreateRequisitionType, ApproveRequisitionType, CreateOrderType,
        ChangeOrderQuantityType, InsertInvoiceType, InsertPaymentType extends EventType {}

one sig Quantity, ApprovalStatus extends QualityType {}

one sig QuantityValue_100, QuantityValue_500, QuantityValue_600,
        ApprovedValue extends QualityValue {}


one sig Requisition_1, Order_1, Invoice_1, Invoice_2,
        Payment_1, Payment_2 extends Object {}

one sig Settlement_1, Settlement_2 extends Relator {}

one sig CreateRequisition_1, ApproveRequisition_1, CreateOrder_1,
        ChangeOrderQuantity_1, InsertInvoice_1, InsertInvoice_2,
        InsertPayment_1, InsertPayment_2 extends AtomicEvent {}

one sig Time1, Time2, Time3, Time4, Time5, Time6, Time7, Time8 extends Time {}


one sig RequisitionQuantity_500,
        RequisitionApproved,
        OrderQuantity_500,
        OrderQuantity_600,
        Invoice_1_Quantity_500,
        Invoice_2_Quantity_100 extends QVAS {}


pred exampleFromWillPaper_normal_gOCED {

    Requisition_1.instanceOfOT = RequisitionType
    Order_1.instanceOfOT = OrderType
    Invoice_1.instanceOfOT = InvoiceType
    Invoice_2.instanceOfOT = InvoiceType
    Payment_1.instanceOfOT = PaymentType
    Payment_2.instanceOfOT = PaymentType



    CreateRequisition_1.OfEventType = CreateRequisitionType
    ApproveRequisition_1.OfEventType = ApproveRequisitionType
    CreateOrder_1.OfEventType = CreateOrderType
    ChangeOrderQuantity_1.OfEventType = ChangeOrderQuantityType
    InsertInvoice_1.OfEventType = InsertInvoiceType
    InsertInvoice_2.OfEventType = InsertInvoiceType
    InsertPayment_1.OfEventType = InsertPaymentType
    InsertPayment_2.OfEventType = InsertPaymentType


    CreateRequisition_1.beginAt = Time1
    ApproveRequisition_1.beginAt = Time2
    CreateOrder_1.beginAt = Time3
    ChangeOrderQuantity_1.beginAt = Time4
    InsertInvoice_1.beginAt = Time5
    InsertInvoice_2.beginAt = Time6
    InsertPayment_1.beginAt = Time7
    InsertPayment_2.beginAt = Time8


    Requisition_1.wasCreatedIn = CreateRequisition_1
    Requisition_1.participatedIn = ApproveRequisition_1 + CreateOrder_1
    no Requisition_1.wasTerminatedIn

    Order_1.wasCreatedIn = CreateOrder_1
    Order_1.participatedIn =
        ChangeOrderQuantity_1
        + InsertInvoice_1
        + InsertInvoice_2
        + InsertPayment_1
        + InsertPayment_2
    no Order_1.wasTerminatedIn

    Invoice_1.wasCreatedIn = InsertInvoice_1
    Invoice_1.participatedIn = InsertPayment_1
    no Invoice_1.wasTerminatedIn

    Invoice_2.wasCreatedIn = InsertInvoice_2
    Invoice_2.participatedIn = InsertPayment_2
    no Invoice_2.wasTerminatedIn

    Payment_1.wasCreatedIn = InsertPayment_1
    no Payment_1.participatedIn
    no Payment_1.wasTerminatedIn

    Payment_2.wasCreatedIn = InsertPayment_2
    no Payment_2.participatedIn
    no Payment_2.wasTerminatedIn


    Requisition_1.beginAt = Time1
    Order_1.beginAt = Time3
    Invoice_1.beginAt = Time5
    Invoice_2.beginAt = Time6
    Payment_1.beginAt = Time7
    Payment_2.beginAt = Time8

    no Object.endAt


    Settlement_1.instanceOfRT = SettlementType
    Settlement_2.instanceOfRT = SettlementType

    Settlement_1.mediates = Order_1 + Invoice_1 + Payment_1
    Settlement_2.mediates = Order_1 + Invoice_2 + Payment_2

    Settlement_1.wasCreatedIn = InsertPayment_1
    Settlement_2.wasCreatedIn = InsertPayment_2

    no Settlement_1.participatedIn
    no Settlement_2.participatedIn

    no Settlement_1.wasTerminatedIn
    no Settlement_2.wasTerminatedIn

    Settlement_1.beginAt = Time7
    Settlement_2.beginAt = Time8

    no Relator.endAt

    RequisitionQuantity_500.concernsQT = Quantity
    RequisitionQuantity_500.qvasHasQV = QuantityValue_500
    RequisitionQuantity_500.standsIn = Requisition_1
    RequisitionQuantity_500.beginAt = Time1
    no RequisitionQuantity_500.endAt

    RequisitionApproved.concernsQT = ApprovalStatus
    RequisitionApproved.qvasHasQV = ApprovedValue
    RequisitionApproved.standsIn = Requisition_1
    RequisitionApproved.beginAt = Time2
    no RequisitionApproved.endAt

    OrderQuantity_500.concernsQT = Quantity
    OrderQuantity_500.qvasHasQV = QuantityValue_500
    OrderQuantity_500.standsIn = Order_1
    OrderQuantity_500.beginAt = Time3
    OrderQuantity_500.endAt = Time4

    OrderQuantity_600.concernsQT = Quantity
    OrderQuantity_600.qvasHasQV = QuantityValue_600
    OrderQuantity_600.standsIn = Order_1
    OrderQuantity_600.beginAt = Time4
    no OrderQuantity_600.endAt

    Invoice_1_Quantity_500.concernsQT = Quantity
    Invoice_1_Quantity_500.qvasHasQV = QuantityValue_500
    Invoice_1_Quantity_500.standsIn = Invoice_1
    Invoice_1_Quantity_500.beginAt = Time5
    no Invoice_1_Quantity_500.endAt

    Invoice_2_Quantity_100.concernsQT = Quantity
    Invoice_2_Quantity_100.qvasHasQV = QuantityValue_100
    Invoice_2_Quantity_100.standsIn = Invoice_2
    Invoice_2_Quantity_100.beginAt = Time6
    no Invoice_2_Quantity_100.endAt

    CreateRequisition_1.broughtAbout = RequisitionQuantity_500
    ApproveRequisition_1.broughtAbout = RequisitionApproved
    CreateOrder_1.broughtAbout = OrderQuantity_500
    ChangeOrderQuantity_1.broughtAbout = OrderQuantity_600
    InsertInvoice_1.broughtAbout = Invoice_1_Quantity_500
    InsertInvoice_2.broughtAbout = Invoice_2_Quantity_100

    no InsertPayment_1.broughtAbout
    no InsertPayment_2.broughtAbout



    RequisitionApproved.contributeToTrigger = CreateOrder_1

    no RequisitionQuantity_500.contributeToTrigger
    no OrderQuantity_500.contributeToTrigger
    no OrderQuantity_600.contributeToTrigger
    no Invoice_1_Quantity_500.contributeToTrigger
    no Invoice_2_Quantity_100.contributeToTrigger

    no CreateRequisition_1.historicallyDependsOn

    ApproveRequisition_1.historicallyDependsOn = CreateRequisition_1
    CreateOrder_1.historicallyDependsOn = ApproveRequisition_1
    ChangeOrderQuantity_1.historicallyDependsOn = CreateOrder_1
    InsertInvoice_1.historicallyDependsOn = ChangeOrderQuantity_1
    InsertInvoice_2.historicallyDependsOn = ChangeOrderQuantity_1
    InsertPayment_1.historicallyDependsOn = InsertInvoice_1
    InsertPayment_2.historicallyDependsOn = InsertInvoice_2

    no Event.properPartOf
    no ComplexEvent
    no Quality



    Object =
        Requisition_1 + Order_1 + Invoice_1 + Invoice_2 + Payment_1 + Payment_2

    Relator =
        Settlement_1 + Settlement_2

    Endurant =
        Requisition_1 + Order_1 + Invoice_1 + Invoice_2 + Payment_1 + Payment_2
        + Settlement_1 + Settlement_2

    AtomicEvent =
        CreateRequisition_1 + ApproveRequisition_1 + CreateOrder_1
        + ChangeOrderQuantity_1
        + InsertInvoice_1 + InsertInvoice_2
        + InsertPayment_1 + InsertPayment_2

    Event =
        CreateRequisition_1 + ApproveRequisition_1 + CreateOrder_1
        + ChangeOrderQuantity_1
        + InsertInvoice_1 + InsertInvoice_2
        + InsertPayment_1 + InsertPayment_2

    Time =
        Time1 + Time2 + Time3 + Time4 + Time5 + Time6 + Time7 + Time8

    ObjectType =
        RequisitionType + OrderType + InvoiceType + PaymentType

    RelatorType =
        SettlementType

    EventType =
        CreateRequisitionType + ApproveRequisitionType + CreateOrderType
        + ChangeOrderQuantityType + InsertInvoiceType + InsertPaymentType

    QualityType =
        Quantity + ApprovalStatus

    QualityValue =
        QuantityValue_100 + QuantityValue_500 + QuantityValue_600 + ApprovedValue

    QVAS =
        RequisitionQuantity_500
        + RequisitionApproved
        + OrderQuantity_500
        + OrderQuantity_600
        + Invoice_1_Quantity_500
        + Invoice_2_Quantity_100

    EndurantType =
        ObjectType + RelatorType + QualityType
}

run exampleFromWillPaper_normal_gOCED