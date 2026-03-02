%%%
title = "OpenID Connect Session Quota - draft 00"
abbrev = "openid-session-quota"
ipr = "none"
workgroup = "OpenID Connect"
keyword = ["security", "openid", "lifecycle"]

[seriesInfo]
name = "Internet-Draft"
value = "OpenID Connect Session Quota-1_0"
status = "standard"

[[author]]
initials="A.D."
surname="Deinega"
fullname="Andrii Deinega"
organization="Independent"
[author.address]
email = "andrii.deinega@gmail.com"

%%%

.# Abstract
Draft of OpenID Connect Session Quota.

{mainmatter}

# Introduction

OpenID Connect 1.0 is a simple identity layer on top of the OAuth 2.0 protocol. It enables Clients to verify the identity of the End-User based on the authentication performed by an Authorization Server, as well as to obtain basic profile information about the End-User in an interoperable and REST-like manner.
OpenID Connect Session Management 1.0 describes how to manage sessions for OpenID Connect, including when to log out the End-User.
This specification complements both specifications by enabling the setting of limits on the number of concurrent sessions for a user or for all users in total by a client to an OP. The client includes this information in the authentication request.

## Requirements Notation and Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in BCP 14 [@!RFC2119] [@!RFC8174] when, and only when, they appear in all capitals, as shown here.
Throughout this document, values are quoted to indicate that they are to be taken literally.
When using these values in protocol messages, the quotes MUST NOT be used as part of the value.

## Terminology
This specification uses the terms "Authorization Endpoint", "Authorization Server", "Client", and "Client Identifier" defined by OAuth 2.0 [RFC6749], the term "User Agent" defined by RFC 7230 [RFC7230], and the terms defined by OpenID Connect Core 1.0 [OpenID.Core].

## Overview

A client (RP) prepares an `Authentication Request` with either one, or two additional parameters at the same time:

`user` (number):
:  the max number of concurrent sessions per the same End-User.

`global` (number):
:  the max number of concurrent sessions for all End-Users.

After authentication the End-User, an OP MUST return `Authentication Error Response` if one of the values specified in these parameters exceed their respective quota.
The error code MUST be to be set to `request_quota_reached`, the `error_description` parameter MAY include additional information.

## OpenID Provider Discovery Metadata

The `request_quota_types_supported` parameter MUST be included in the Server's discovery responses when Session Quotas are supported by an OP

`request_quota_types_supported` (array of strings):
:  A list of the quota mechanisms supported by the OP, possible values are `user` and `global`.

# Privacy Considerations

TBC.

# Security Considerations

The authentication requests MUST be passed using JAR [RFC9101], PAR [RFC9126], or alternatively by [value](https://openid.net/specs/openid-connect-core-1_0.html#RequestObject) for the purpose of protecting its integrity and confidentiality.

# IANA Considerations

No new registrations.

{backmatter}

<reference anchor="OpenID.Core" target="https://openid.net/specs/openid-connect-core-1_0.html">
  <front>
    <title>OpenID Connect Core 1.0 incorporating errata set 2</title>
    <author fullname="Nat Sakimura" initials="N." surname="Sakimura">
      <organization abbrev="NAT.Consulting (was at NRI)">NAT.Consulting</organization>
    </author>
    <author fullname="John Bradley" initials="J." surname="Bradley">
      <organization abbrev="Yubico (was at Ping Identity)">Yubico</organization>
    </author>
    <author fullname="Michael B. Jones" initials="M.B." surname="Jones">
      <organization abbrev="Self-Issued Consulting (was at Microsoft)">Self-Issued Consulting</organization>
    </author>
    <author fullname="Breno de Medeiros" initials="B." surname="de Medeiros">
      <organization abbrev="Google">Google</organization>
    </author>
    <author fullname="Chuck Mortimore" initials="C." surname="Mortimore">
      <organization abbrev="Disney (was at Salesforce)">Disney</organization>
    </author>
    <date day="15" month="December" year="2023"/>
  </front>
</reference>

# Use Cases

<!-- TBC. -->

# Acknowledgments

TBC.

# Document History

[[ To be removed from the final specification ]]

- 00
  Initial draft.
