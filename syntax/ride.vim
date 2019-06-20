" Vim syntax file
" Language: RIDE
" Maintainer: Ruslan Osmanov <rrosmanov@gmail.com>
if exists("b:current_syntax")
    finish
endif

syntax keyword rideKeyword let this
syntax keyword rideConditional if then else match
syntax keyword rideLabel case
syntax keyword rideKeyword return
syntax keyword rideException throw
syntax keyword rideFunction toBase58String toUtf8String getInteger getString getBoolean toString getBinary
syntax keyword rideFunction getIntegerValue getBooleanValue getBinaryValue getStringValue getBinaryValue
syntax keyword rideFunction fromBase58String fromBase64String rsaVerify
syntax keyword rideFunction sigVerify sha256 toBytes take takeRight drop dropRight
syntax keyword rideFunction size isDefined extract getElement value valueWithErrorMessage extractWithErrorMessage
syntax keyword rideFunction cons indexOf split parseInt parseIntValue pow log keccak256 blake2b256
syntax keyword rideFunction addressFromPublicKey addressFromString addressFromRecipient
syntax keyword rideFunction assetBalance wavesBalance assetInfo blockInfoByHeight transferTransactionById

syntax keyword rideBoolean false true
syntax keyword rideType Int Integer String Boolean ByteVector
syntax keyword rideType Transaction InvokeScriptTransaction DataTransaction IssueTransaction
syntax keyword rideType LeaseTransaction LeaseCancelTransaction TransferTransaction SetScriptTransaction
syntax keyword rideType Invocation Address Order Alias ScriptTransfer
syntax keyword rideType AttachedPayment
syntax keyword rideTodos contained TODO XXX FIXME NOTE
syntax keyword rideFunction WriteSet TransferSet ScriptResult DataEntry

syntax match rideComment "\v#.*$" contains=rideTodos

syntax match rideOperator "\v\*"
syntax match rideOperator "\v\%"
syntax match rideOperator "\v/"
syntax match rideOperator "\v\+"
syntax match rideOperator "\v\-"
syntax match rideOperator "\v\?"
syntax match rideOperator "\v\*\="
syntax match rideOperator "\v/\="
syntax match rideOperator "\v\+\="
syntax match rideOperator "\v-\="
syntax match rideOperator "\v\="
syntax match rideOperator "\v\="
syntax match rideOperator "\v\=\>"
syntax match rideOperator "\v\>"
syntax match rideOperator "\v\<"
syntax match rideOperator "\v\<\="
syntax match rideOperator "\v\>\="
syntax match rideOperator "\v\|\|"
syntax match rideString "\v\"[^\"]*\""


syntax region rideAnnotation start="\v\@(Callable|Verifier)\s*\(" end="\v\)"
"syntax region rideAnnotationArg start="\v\@(Callable|Verifier)\s*\(" end=+)+ contains=rideAnnotation,rideFuncArg

syntax match rideFunc "\v<func>"
syntax match rideArg "\v\(?[a-zA-Z0-9_]+\:" contains=rideType
syntax region rideFuncDeclaration start="\v<func\s+[^\(]+\(" end=+)+ contains=rideFunc,rideType,rideArg
"syntax region rideFuncCall start="\v<[a-zA-Z0-9_]+\(" end=+)+

syntax match rideNumber "\v<(\+|\-)?\d+(\.\d+)?>"
syntax region ridePreproc start="{-#" end="#-}"

syntax match rideBase58 "\v<base58>"
syntax region rideBase58Const start="\v\'" end="\v\'" contains=rideBase58

highlight link rideArg Label
highlight link rideKeyword Keyword
highlight link rideFunc Keyword
highlight link rideBase58 Keyword
highlight link rideBase58Const String
highlight link rideConditional Conditional
highlight link rideFunction Function
"highlight link rideFuncCall Function
highlight link rideFuncDeclaration Function
highlight link rideComment Comment
highlight link rideOperator Operator
highlight link rideNumber Number
highlight link rideBoolean Boolean
highlight link rideType Type
highlight link ridePreproc PreCondit
highlight link rideAnnotation PreProc
"highlight link rideAnnotationArg StorageClass
highlight link rideException Exception
highlight link rideTodos Todo
highlight link rideString String
highlight link rideLabel Label

let b:current_syntax = "ride"

" vim: et ts=4 sts=4 sw=4 fdm=marker
