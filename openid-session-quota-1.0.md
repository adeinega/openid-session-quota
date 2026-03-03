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

OpenID Connect 1.0 is a simple identity layer on top of the OAuth 2.0 protocol. It enables Clients to verify the
identity of the End-User based on the authentication performed by an Authorization Server, as well as to obtain basic
profile information about the End-User in an interoperable and REST-like manner. OpenID Connect Session Management 1.0
describes how to manage sessions for OpenID Connect, including when to log out the End-User.
This specification complements both specifications by enabling the setting of limits on the number of concurrent
sessions for a user or for all users in total by a client to an OP. The client includes this information in the
authentication request.

## Requirements Notation and Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",
"NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in BCP 14 [@!RFC2119]
[@!RFC8174] when, and only when, they appear in all capitals, as shown here. Throughout this document, values are
quoted to indicate that they are to be taken literally. When using these values in protocol messages, the quotes
MUST NOT be used as part of the value.

## Terminology

This specification uses the terms "Authorization Endpoint", "Authorization Server", "Client" and "Client Identifier"
defined by OAuth 2.0 [RFC6749], and the terms defined by OpenID Connect Core 1.0 [@!OpenID.Core] and OpenID Connect
Session Management 1.0 [@!OpenID.Session].

## Overview

A client (RP) prepares an `Authentication Request` containing the desired request parameters and includes one, or two
additional parameters (at the same time) related quotas

`quota_user` (number):
:  The maximum number of concurrent sessions per the same End-User.

`quota_global` (number):
:  The maximum number of concurrent sessions of all End-Users.

After authentication of an End-User, the OP compares the values provided in the requested parameters with its existing
information. The OP MAY return `Authentication Error Response` to an RP if any of values in the requested parameters
exceed their respective quotas. Alternatively, the OP can decide to go a different route, for instance, invalidate
other End-User sessions for this RP. These, the specific actions taken are at the OS's discretion, based on its
configuration, policies, and preferences.

## OpenID Provider Discovery Metadata

The `request_quota_types_supported` parameter MUST be included in the Server's discovery responses when Session Quotas
are supported by an OP.

`request_quota_types_supported` (array of strings):
:  A list of the quota mechanisms supported by the OP, possible values are `user` and `global`.

# Privacy Considerations

TBC.

# Security Considerations

The authentication requests MUST be passed using JAR [@!RFC9101], PAR [@!RFC9126], or alternatively by value as
described in section 6.1 of [@!OpenID.Core] for the purpose of protecting its integrity.

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

<reference anchor="OpenID.Session" target="https://openid.net/specs/openid-connect-session-1_0.html">
    <front>
        <title>OpenID Connect Session Management 1.0</title>
        <author fullname="Breno de Medeiros" initials="B." surname="de Medeiros">
            <organization>Google</organization>
        </author>
        <author fullname="Naveen Agarwal" initials="N." surname="Agarwal">
            <organization>Microsoft</organization>
        </author>
        <author fullname="Nat Sakimura" initials="N." surname="Sakimura">
            <organization abbrev="NAT.Consulting">NAT.Consulting</organization>
        </author>
        <author fullname="John Bradley" initials="J." surname="Bradley">
            <organization abbrev="Yubico">Yubico</organization>
        </author>
        <author fullname="Michael B. Jones" initials="M.B." surname="Jones">
            <organization abbrev="Microsoft">Microsoft</organization>
        </author>
        <date day="12" month="September" year="2022"/>
    </front>
</reference>

# Use Cases

## Use Case 1

An administrator gets a request to start enforcing user session quotas for one of the enterprise applications. Instead
of implementing quota logic directly within the application, he wants to completely delegate this to an OP, which is
already in use by all applications in the organization. He manages hundreds of such applications and requirements tend
to change frequently over short periods of time. Because all of this, it's hard to justify implementing and maintaining
such quota logic separately within each individual application rather than centrally at the OP level. Additionally,
some of the applications are provided by third party software vendors, which means, their internal implementation
aspects cannot be modified to support custom logic that easily and fast.

## Use Case 2

A Wi-Fi router manufacturer wants to enforce an administrative quotas to one concurrent session for its management
console which is already uses OpenID Connect for authentification. However, due to the hardware restrictions the device
does not really want to store, nor track any additional data to store, and keep track of sessions.

# Acknowledgments

TBC.

# Document History

[[ To be removed from the final specification ]]

- 00
  Initial draft.
