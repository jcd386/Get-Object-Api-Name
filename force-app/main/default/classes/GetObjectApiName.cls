public with sharing class GetObjectApiName {

    public class Input {
        @InvocableVariable(required=true label='Record ID' description='The Record ID to identify the object type for')
        public String recordId;
    }

    public class Output {
        @InvocableVariable(label='Object API Name')
        public String objectApiName;

        @InvocableVariable(label='Success')
        public Boolean success;

        @InvocableVariable(label='Error Message')
        public String errorMessage;
    }

    @InvocableMethod(
        label='Get Object API Name'
        description='Returns the API name of the SObject that a Record ID belongs to'
        category='Utilities'
    )
    public static List<Output> getObjectApiNames(List<Input> inputs) {
        List<Output> outputs = new List<Output>();
        for (Input input : inputs) {
            outputs.add(processInput(input));
        }
        return outputs;
    }

    @TestVisible
    private static Output processInput(Input input) {
        Output output = new Output();
        try {
            if (String.isBlank(input.recordId)) {
                output.success = false;
                output.errorMessage = 'Record ID is required';
                return output;
            }
            Id parsedId = Id.valueOf(input.recordId);
            output.objectApiName = parsedId.getSObjectType().getDescribe().getName();
            output.success = true;
        } catch (Exception e) {
            output.success = false;
            output.errorMessage = e.getMessage();
        }
        return output;
    }
}
