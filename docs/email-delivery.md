# OpenClaw Email Delivery

## Overview

OpenClaw writes task results to the workspace.

Mission Control monitors the workspace and sends result files by email when email delivery is enabled.

The workspace remains the system of record.

## Primary Recipient

Configure the primary recipient in:

**Mission Control → Email Settings**

All result emails are sent to this address.

---

## CC Recipients

You may add additional visible recipients by including any of the following lines in your task prompt:

```text
CC1: user1@example.com
CC2: user2@example.com
CC3: user3@example.com
```

CC recipients are visible to all recipients.

---

## BCC Recipients

You may add hidden recipients by including any of the following lines in your task prompt:

```text
BCC1: user1@example.com
BCC2: user2@example.com
BCC3: user3@example.com
```

BCC recipients receive the email but remain hidden from all other recipients.

---

## Example Task With CC and BCC

```text
Agent1 run a new task. I need a promotional email and Instagram caption for a new fall collection launch. Highlight key pieces, current trends, and create urgency for limited inventory. Keep the tone stylish and on-brand.

CC1: marketing-manager@example.com
BCC1: social-archive@example.com
```

Result:

* The primary email recipient receives the result.
* The marketing manager receives a visible copy (CC).
* The social archive mailbox receives a hidden copy (BCC).
* BCC recipients remain hidden from all other recipients.
* CC/BCC lines are removed from the delivered email body.

---

## Behavior

* CC recipients are visible to all recipients.
* BCC recipients are hidden from all other recipients.
* CC and BCC lines are removed from the delivered email body before delivery.
* Result files remain unchanged in the workspace.
* Mission Control handles email delivery.
* OpenClaw creates workspace artifacts only.

---

## Notes

* Email delivery failures do not modify result files.
* Workspace artifacts remain the authoritative record of task execution.
* CC and BCC recipients are optional.
* Up to three CC recipients and three BCC recipients are supported.
