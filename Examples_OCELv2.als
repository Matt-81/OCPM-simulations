module Examples_OCELv2

open MetaModel_OCELv2_Try01

// one sig StudentType, ProfessorType extends ObjectType {}
// one sig AssignSupervisor extends EventType {}

// one sig S, M, D extends Object {}
// one sig e1, e2 extends Event {}
// one sig Time1, Time2 extends Time {}

// pred supervisor_scenario1 {
//     S.OfObjectType = StudentType
//     M.OfObjectType = ProfessorType
//     D.OfObjectType = ProfessorType

//     e1.OfEventType = AssignSupervisor
//     e2.OfEventType = AssignSupervisor

//     e1.ObservedAt = Time1
//     e2.ObservedAt = Time2

//     e1.observes = S + M
//     e2.observes = S + D

//     oRelation = S -> (M + D)

//     no EventAtt
//     no ObjectAtt
//     no EventAttributeValue
//     no ObjectAttributeValue

//     StudentType.OThasAtt = none
//     ProfessorType.OThasAtt = none
//     AssignSupervisor.EThasAtt = none

//     Object = S + M + D
//     Event = e1 + e2
//     Time = Time1 + Time2
//     ObjectType = StudentType + ProfessorType
//     EventType = AssignSupervisor
// }

// run supervisor_scenario1 for 5


// one sig SupervisorAtt extends ObjectAtt {}
// one sig supervisorM, supervisorMD extends ObjectAttributeValue {}

// pred supervisor_scenario2 {
//     S.OfObjectType = StudentType
//     M.OfObjectType = ProfessorType
//     D.OfObjectType = ProfessorType

//     e1.OfEventType = AssignSupervisor
//     e2.OfEventType = AssignSupervisor

//     StudentType.OThasAtt = SupervisorAtt
//     ProfessorType.OThasAtt = none
//     AssignSupervisor.EThasAtt = none

//     e1.ObservedAt = Time1
//     e2.ObservedAt = Time2

//     e1.observes = S + M
//     e2.observes = S + D

//     supervisorM.ValueOfOAtt = SupervisorAtt
//     supervisorMD.ValueOfOAtt = SupervisorAtt

//     supervisorM.hasTime = Time1
//     supervisorMD.hasTime = Time2

//     S.oHas = supervisorM + supervisorMD
//     M.oHas = none
//     D.oHas = none

//     oRelation = S -> (M + D)

//     no EventAtt
//     no EventAttributeValue

//     Object = S + M + D
//     Event = e1 + e2
//     Time = Time1 + Time2
//     ObjectType = StudentType + ProfessorType
//     EventType = AssignSupervisor
//     ObjectAtt = SupervisorAtt
//     ObjectAttributeValue = supervisorM + supervisorMD
// }

// run supervisor_scenario2 for 5

// one sig POType, InvoiceType, InvoiceLineItemType extends ObjectType {}
// one sig CreatePO, ReleasePO, IssueInvoice extends EventType {}
// one sig ReleaseStatus, PaymentBlock extends ObjectAtt {}
// one sig PO_1, IV_1, ILI_1 extends Object {}
// one sig e_1, e_2, e_3 extends Event {}
// one sig Time1, Time2, Time3 extends Time {}
// one sig NonReleased, Released, Active extends ObjectAttributeValue {}

// pred po_scenario1 {
//     PO_1.OfObjectType = POType
//     IV_1.OfObjectType = InvoiceType
//     ILI_1.OfObjectType = InvoiceLineItemType

//     e_1.OfEventType = CreatePO
//     e_2.OfEventType = ReleasePO
//     e_3.OfEventType = IssueInvoice

//     e_1.ObservedAt = Time1
//     e_2.ObservedAt = Time2
//     e_3.ObservedAt = Time3

//     e_1.observes = PO_1
//     e_2.observes = PO_1
//     e_3.observes = IV_1 + ILI_1 + PO_1

//     POType.OThasAtt = ReleaseStatus
//     InvoiceType.OThasAtt = PaymentBlock
//     InvoiceLineItemType.OThasAtt = none

//     CreatePO.EThasAtt = none
//     ReleasePO.EThasAtt = none
//     IssueInvoice.EThasAtt = none

//     NonReleased.ValueOfOAtt = ReleaseStatus
//     Released.ValueOfOAtt = ReleaseStatus
//     Active.ValueOfOAtt = PaymentBlock

//     NonReleased.hasTime = Time1
//     Released.hasTime = Time2
//     Active.hasTime = Time3

//     PO_1.oHas = NonReleased + Released
//     IV_1.oHas = Active
//     no ILI_1.oHas

//     oRelation = ILI_1 -> IV_1 + IV_1 -> PO_1

//     no EventAtt
//     no EventAttributeValue

//     Object = PO_1 + IV_1 + ILI_1
//     Event = e_1 + e_2 + e_3
//     Time = Time1 + Time2 + Time3
//     ObjectType = POType + InvoiceType + InvoiceLineItemType
//     EventType = CreatePO + ReleasePO + IssueInvoice
//     ObjectAtt = ReleaseStatus + PaymentBlock
//     ObjectAttributeValue = NonReleased + Released + Active
// }

// run po_scenario1

------------------------------------------------------------------------------
------------------------------------------------------------------------------
one sig Requisition, Order, Invoice, Payment extends ObjectType {}

one sig CreateR, ApproveR, CreateO, ChangeOQuantity,
        InsertInvoice, InsertPayment extends EventType {}

one sig Quantity extends ObjectAtt {}

one sig Re_1, O_1, In_1, In_2, P_1, P_2 extends Object {}

one sig e_1, e_2, e_3, e_4, e_5, e_6, e_7, e_8 extends Event {}

one sig Time1, Time2, Time3, Time4, Time5, Time6, Time7, Time8 extends Time {}

one sig Q500, Q600 extends ObjectAttributeValue {}

pred exampleFromWillPaper_normal_OCELv2 {
    Re_1.OfObjectType = Requisition
    O_1.OfObjectType = Order
    In_1.OfObjectType = Invoice
    In_2.OfObjectType = Invoice
    P_1.OfObjectType = Payment
    P_2.OfObjectType = Payment

    e_1.OfEventType = CreateR
    e_2.OfEventType = ApproveR
    e_3.OfEventType = CreateO
    e_4.OfEventType = ChangeOQuantity
    e_5.OfEventType = InsertInvoice
    e_6.OfEventType = InsertInvoice
    e_7.OfEventType = InsertPayment
    e_8.OfEventType = InsertPayment

    e_1.ObservedAt = Time1
    e_2.ObservedAt = Time2
    e_3.ObservedAt = Time3
    e_4.ObservedAt = Time4
    e_5.ObservedAt = Time5
    e_6.ObservedAt = Time6
    e_7.ObservedAt = Time7
    e_8.ObservedAt = Time8

    e_1.observes = Re_1
    e_2.observes = Re_1
    e_3.observes = Re_1 + O_1
    e_4.observes = O_1
    e_5.observes = O_1 + In_1
    e_6.observes = O_1 + In_2
    e_7.observes = In_1 + P_1
    e_8.observes = In_2 + P_2

    Quantity in Order.OThasAtt
    Order.OThasAtt = Quantity
    no Requisition.OThasAtt
    no Invoice.OThasAtt
    no Payment.OThasAtt

    Q500.ValueOfOAtt = Quantity
    Q500.hasTime = Time3

    Q600.ValueOfOAtt = Quantity
    Q600.hasTime = Time4

    O_1.oHas = Q500 + Q600

    no Re_1.oHas
    no In_1.oHas
    no In_2.oHas
    no P_1.oHas
    no P_2.oHas

    oRelation =
        Re_1 -> O_1
        + O_1 -> In_1
        + O_1 -> In_2
        + In_1 -> P_1
        + In_2 -> P_2

    no EventAtt
    no EventAttributeValue
    no EventType.EThasAtt

    Object = Re_1 + O_1 + In_1 + In_2 + P_1 + P_2
    Event = e_1 + e_2 + e_3 + e_4 + e_5 + e_6 + e_7 + e_8
    Time = Time1 + Time2 + Time3 + Time4 + Time5 + Time6 + Time7 + Time8

    ObjectType = Requisition + Order + Invoice + Payment
    EventType = CreateR + ApproveR + CreateO + ChangeOQuantity + InsertInvoice + InsertPayment

    ObjectAtt = Quantity
    ObjectAttributeValue = Q500 + Q600
}

run exampleFromWillPaper_normal_OCELv2