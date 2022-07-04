-------------------------- MODULE MC2_8 ---------------------------------------
\* an instance of BinSearch with all parameters fixed
EXTENDS Apalache

\* fix 8 bits
INT_WIDTH == 8

\* We do not fix INT_SEQ and INPUT_KEY.
\* Instead, we reason about all sequences with ConstInit.

CONSTANTS
    \* The input sequence.
    \*
    \* @type: Seq(Int);
    INPUT_SEQ,
    \* The key to search for.
    \*
    \* @type: Int;
    INPUT_KEY

\* introduce the variables to be used in BinSearch
VARIABLES
    \* @type: Int;
    low,
    \* @type: Int;
    high,
    \* @type: Bool;
    isTerminated,
    \* @type: Int;
    returnValue,
    \* The number of executed steps.
    \* @type: Int;
    nSteps

\* use an instance for the fixed constants
INSTANCE BinSearch

\* Instead of checking a concrete sequence, which is not very exciting,
\* we simply initialize constants with arbitrary values of proper types.
ConstInit ==
    /\ INPUT_KEY = Gen(1)
    /\ INPUT_SEQ = Gen(MAX_INT)

===============================================================================