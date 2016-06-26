Title: Assertions
# Assertions

Assertions are digitally signed document that provide information about entities in the snappy system based on its id -- as such they are the basis of trust and control between developers of devices, developers of software, and anyone managing devices, and the user of a device.

## IDs

The unique “id” used in the snappy system is a sequence of 32 random characters taken out of an alphabet of 62 characters (uppercase letters + lowercase letters + numbers), for a total of 310 bits of space. This also means ids are case sensitive

These ids are generated centrally or delegated to known parties. In most cases
id aren't exposed in primary user interfaces or used in everyday operations or development for snappy systems.

## The Assertion format

An assertion consists of a set of headers, optional body content and signature. The typical format of an assertion, with common headers, is as follows:

    type:          single-word  // eg “account” or “model” or “model-snap-cert”
    authority-id:  account-id   // on whose authority this assertion is made
    series:        value
    index-item-1:  value        // identifying the object of this assertion
    index-item-2:  value
    ...
    revision:      integer      // assertions can be updated with a higher revision
    
    BO                          // free-form text
    
    signature                   // both key id and signature itself

Assertions have a media type of `application/x.ubuntu.assertion`.

## The signature

The assertion signature will follow the OpenPGP ASCII armored format, as described in [RFC 4880](https://tools.ietf.org/html/rfc4880).

## Assertion validation
In order to validate an assertion, snappy must follow a very specific process:

1. The content of the assertion (headers and body) must be correct for the assertion type.
2. The authority-id must be appropriate the particular assertion type and items it is making a statement about. For example, if asserting detail about a snap the authority must be the publisher (or their delegate).
3. If the authority isn't also the signatory, the signatory must be appropriately empowered by the authority-id.
4. The signing key must have been defined as appropriate for the purpose of signing this type of assertion.
5. The signature on the assertion must validate with that key.

## Types of assertion

The types of assertions available in the snappy system are:

- Personal and institutional assertions based around a Snap Store account-id which can be used to describe:
 - the account name.
 - the account's pubic keys.
 - the types of assertion keys can be used on. 
- Device assertions, that define:
 - the device model.
 - the device serial number.
 - certification, which means that the device model will be guaranteed to get security and stability updates.
 - ownership
- Snap assertions, that define:
 - the snap name 
 - the snap's build
 - the stores it can be distributed in
 - whether the snap is free or paid
 - ownership
 - gated updates
- Store assertions, which define:
 - delectation of responsibility, such those of a publisher to a developer

## Roles within an assertion

Individuals or organizations will have one account within the snappy system, however they can perform various roles and make assertions on the basis of those foles:

- brand, the creator of a device model or device models.
- a publisher, the controller of a snap's publication and distribution rules.
- a developer, who writes and publishes software (but may not own the policies for that software).
- an owner, who has control of the policies that govern the use of a device.
- an owner, a person who can logon to and operate a device. 
 

 

