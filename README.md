## Design Patterns Used

### 1. Value Object
* **Purpose:** Represents simple, immutable entities defined by their value rather than a unique identifier.
* **Implementation:** `app/models/money.rb`
* **Description:** Used to manage monetary amounts and currencies without relying on a database table.

### 2. Service Object
* **Purpose:** Encapsulates complex business logic or multi-step operations.
* **Implementation:** `app/services/invoice_generator.rb`
* **Description:** Handles invoice creation within a transaction, keeping controllers and models thin.

### 3. Form Object
* **Purpose:** Handles validations and data persistence for complex, multi-model form submissions.
* **Implementation:** `app/forms/client_onboarding_form.rb`
* **Description:** Decouples form logic and model creation from the controller.

### 4. Query Object
* **Purpose:** Isolates complex database queries from models and controllers.
* **Implementation:** `app/queries/unpaid_invoice_query.rb`
* **Description:** Encapsulates scoping and filtering logic for unpaid invoices.

### 5. Decorator
* **Purpose:** Adds presentational behavior to models without modifying their classes.
* **Implementation:** `app/decorators/invoice_decorator.rb`
* **Description:** Uses the `draper` gem to format data and generate presentational elements for views.

### 6. Presenter (View Object)
* **Purpose:** Handles and shapes complex view data.
* **Implementation:** `app/presenters/invoice_dashboard_presenter.rb`
* **Description:** Prepares data summaries (e.g., total billed, outstanding balances) for the UI.

### 7. Policy Object
* **Purpose:** Encapsulates business rules for authorization and access control.
* **Implementation:** `app/policies/invoice_policy.rb`
* **Description:** Determines whether an invoice can be deleted based on user roles and status.

### 8. Builder
* **Purpose:** Separates the construction of a complex object from its representation.
* **Implementation:** `app/builders/invoice_pdf_builder.rb`
* **Description:** Builds PDF payload configurations step by step.

### 9. Interactor (Command Pattern)
* **Purpose:** Represents a single unit of execution or business transaction.
* **Implementation:** `app/interactors/charge_client.rb`
* **Description:** Handles multi-step payment execution and updates state.

### 10. Observer
* **Purpose:** Defines one-to-many dependencies so that state changes trigger dependents automatically.
* **Implementation:** `app/models/concerns/notifiable.rb`
* **Description:** Uses `ActiveSupport::Concern` to trigger callbacks upon object creation.

---
