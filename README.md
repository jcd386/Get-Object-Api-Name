# Get Object API Name

[![Deploy to Salesforce](https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png)](https://githubsfdeploy.herokuapp.com/app/githubdeploy/jcd386/Get-Object-Api-Name?ref=main)

Flow-invocable Apex action that accepts a Record ID and returns the API name of the SObject it belongs to. Useful in Flows that work with generic or polymorphic Record IDs where the object type isn't known at design time.

## Features

- Accepts any valid Salesforce Record ID (15 or 18 character)
- Returns the full API name (e.g., `Account`, `Contact`, `Custom_Object__c`)
- Bulkified for use in loops and collections
- Error handling with success/error message outputs

## Installation

### Option A: One-Click Deploy

Click the "Deploy to Salesforce" button above.

### Option B: SFDX CLI

```bash
# Clone the repo
git clone https://github.com/jcd386/Get-Object-Api-Name.git
cd Get-Object-Api-Name

# Deploy to your org
sf project deploy start --target-org YOUR_ORG_ALIAS
```

## Usage

In Flow Builder, add an **Action** element and search for **"Get Object API Name"** (category: Utilities).

**Inputs:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| Record ID | String | Yes | The Record ID to identify |

**Outputs:**
| Parameter | Type | Description |
|-----------|------|-------------|
| Object API Name | String | The SObject API name (e.g., `myns__Custom_Object__c`) |
| Object API Name Without Namespace | String | The API name without namespace prefix (e.g., `Custom_Object__c`) |
| Success | Boolean | Whether the operation succeeded |
| Error Message | String | Error details if the operation failed |

## Files

| File | Description |
|------|-------------|
| `GetObjectApiName.cls` | Invocable Apex action |
| `GetObjectApiNameTest.cls` | Test class (100% coverage) |

## Author

[We Summit Mountains](https://wesummitmountains.com) — Salesforce Consulting

## License

MIT
