# The Gemini API

Primary system and API concepts are documented in the [User guide](user-guide/README.md).

Overall API conventions are described in the [API conventions doc](dev/api-conventions.md).

Complete API details are documented via [Swagger](http://swagger.io/). The Gemini api server exports an API that can be used to retrieve the [Swagger spec](https://github.com/swagger-api/swagger-spec/tree/master/schemas/v1.2) for the Gemini API, by default at `/swaggerapi`. It also exports a UI you can use to browse the API documentation at `/swagger-ui` if the apiserver is passed --enable-swagger-ui=true flag. We also host generated [API reference docs](api-reference/README.md).

Remote access to the API is discussed in the [access doc](admin/accessing-the-api.md).

The Gemini API also serves as the foundation for the declarative configuration schema for the system. The [Gemctl](user-guide/gemctl/gemctl.md) command-line tool can be used to create, update, delete, and get API objects.

Gemini also stores its serialized state (currently in [etcd](https://coreos.com/docs/distributed-configuration/getting-started-with-etcd/)) in terms of the API resources.

Gemini itself is decomposed into multiple components, which interact through its API.

## API changes

We expect the Gemini API to continuously evolve. Since the API is in beta, we can not guarantee backwards compatibility. New API resources and new resource fields will be added or removed on a frequent basis until the API is take out of beta. When the API is take out of beta, removing or adding resources or fields will follow a deprecation process. The deprecation process has yet to be defined, but once the API reaches 1.0, a policy will be published.

What constitutes a compatible change and how to change the API are detailed by the [API change document](dev/api_changes.md).

## API versioning

To make it easier to evolve the api, while maintaining backwards compatibility, Gemini will support
multiple API versions, each at a different API path, such as `/api/v1beta1` or `/api/v1`.

We chose to version at the API level rather than at the resource or field level to ensure that the API presents a clear, consistent view of system resources and behavior, and to enable controlling access to end-of-lifed and/or experimental APIs.

Note that API versioning and Software versioning are only indirectly related.  The [API and release
versioning proposal](design/versioning.md) describes the relationship between API versioning and
software versioning.


Different API versions imply different levels of stability and support.  The criteria for each level are described
in more detail in the [API Changes documentation](devel/api_changes.md#alpha-beta-and-stable-versions).  They are summarized here:

- Alpha level:
  - The version names contain `alpha` (e.g. `v1alpha1`).
  - May be buggy.  Enabling the feature may expose bugs.  Disabled by default.
  - Support for feature may be dropped at any time without notice.
  - The API may change in incompatible ways in a later software release without notice.
  - Recommended for use only in short-lived testing clusters, due to increased risk of bugs and lack of long-term support.
- Beta level:
  - The version names contain `beta` (e.g. `v2beta3`).
  - Code is well tested.  Enabling the feature is considered safe.  Enabled by default.
  - Support for the overall feature will not be dropped, though details may change.
  - The schema and/or semantics of objects may change in incompatible ways in a subsequent beta or stable release.  When this happens,
    we will provide instructions for migrating to the next version.  This may require deleting, editing, and re-creating
    API objects.  The editing process may require some thought.   This may require downtime for applications that rely on the feature.
  - Recommended for only non-business-critical uses because of potential for incompatible changes in subsequent releases.  If you have
    multiple clusters which can be upgraded independently, you may be able to relax this restriction.
  - **Please do try our beta features and give feedback on them!  Once they exit beta, it may not be practical for us to make more changes.**
- Stable level:
  - The version name is `vX` where `X` is an integer.
  - Stable versions of features will appear in released software for many subsequent versions.
