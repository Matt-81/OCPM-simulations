module OCED

-- =========================
-- BASIC ATTRIBUTE STRUCTURE
-- =========================

-- Represents time points in the model
sig Time {}

-- Abstract set of event attributes (types of attributes)
sig EventAttribute {}

-- Concrete values of event attributes
sig EventAttributeValue extends EventAttribute {}

-- Abstract set of object attributes
sig ObjectAttribute {}

-- Concrete values of object attributes
sig ObjectAttributeValue extends ObjectAttribute {}

-- =========================
-- OBJECT MODELING
-- =========================

-- Abstract type for objects (used for typing/classification)
sig ObjectType {}

-- Labels for relations between objects (e.g., friendOf, worksWith)
sig RelationType {}

-- Concrete objects in the domain
sig Object extends ObjectType {

-- Relations between objects, labeled by RelationType
-- Example: (friendOf -> o2) means this object is friendOf o2
oRelation: set RelationType -> Object,

-- Attributes associated with the object
oHas: set ObjectAttributeValue
}

-- =========================
-- EVENT MODELING
-- =========================

-- Abstract type for events
sig EventType {}

-- Labels qualifying object participation in events (e.g., role names)
sig Qualifier {}

-- Concrete events in the domain
sig Event extends EventType {

-- Each event occurs at exactly one time
observedAt: one Time,

-- Relation linking event to objects with qualifiers
-- Example: (actor -> o1) means o1 participates as actor
observes: set Qualifier -> Object,

-- Attributes associated with the event
eHas: set EventAttributeValue
}

-- =========================
-- DOMAIN EXAMPLE
-- =========================

-- Two specific events (subsets, not necessarily disjoint unless constrained)
-- sig EventA, EventB in Event {}

-- Three object categories, guaranteed disjoint (because of 'extends')
sig StudentA, ProfessorA, ProfessorB extends Object {}

-- Two specific time points
-- sig t1, t2 in Time {}

-- Concrete objects
one sig S extends StudentA {}
one sig M extends ProfessorA {}
one sig D extends ProfessorB {}

-- Concrete events
one sig e1, e2 extends Event {}

-- Concrete time points
one sig Time1, Time2 extends Time {}

fact Scenario {

  -- Event timestamps
  e1.observedAt = Time1
  e2.observedAt = Time2

  -- Observations:
  -- e1 records that S is related to M
  -- e2 records that S is related to D
}

-- =========================
-- SEMANTIC CONSTRAINTS
-- =========================

fact {

-- Every object attribute must have at least one concrete value
all oa: ObjectAttribute | some oav: ObjectAttributeValue | oa = oav

-- Every event attribute must have at least one concrete value
all ea: EventAttribute | some eav: EventAttributeValue | ea = eav

-- Every event type must correspond to at least one event instance
all t: EventType | some e: Event | e = t

-- Every object type must correspond to at least one object instance
all t: ObjectType | some o: Object | o = t

-- Each event has exactly one timestamp (already enforced by 'one', but restated)
all e: Event | one e.observedAt

-- Each event has exactly one attribute value
all e: Event | one e.eHas

-- Each event observes exactly one (Qualifier -> Object) pair
all e: Event | one e.observes

-- Each object must have at least one attribute value
all o: Object | some o.oHas

-- Each object must participate in at least one relation
-- all o: Object | some o.oRelation

-- No object can be related to itself (no self-loops across any relation type)
all o: Object | o not in o.oRelation[RelationType]

-- Every time point must be used by at least one event
all t: Time | some e: Event | e.observedAt = t

-- Every event attribute value must be used by some event
all eav: EventAttributeValue | some e: Event | eav in e.eHas

-- Every object attribute value must be used by some object
all oav: ObjectAttributeValue | some o: Object | oav in o.oHas

-- Every relation type must be used in at least one object-to-object relation
all rt: RelationType |
some o: Object, target: Object | rt -> target in o.oRelation

-- Every qualifier must be used in at least one event-object relation
all q: Qualifier |
some e: Event, o: Object | q -> o in e.observes
}

-- =========================
-- SCOPE CONSTRAINTS
-- =========================

fact {

-- Exactly 2 time points exist
#Time = 2

-- Exactly 3 objects exist
#Object = 3

-- Exactly 1 object in each category
#StudentA = 1
#ProfessorA = 1
#ProfessorB = 1

-- Exactly 2 events exist
#Event = 2

-- (Optional alternative) At least one time exists
#oRelation = 2
#ObjectAttributeValue = 2
}
