using OrderedCollections
using Logging

module OMLCodeAPI

    #
    #
    # Core functions in the OML API
    #
    #

    function createInstance(descriptionIri, instanceName)
        Dict(
            "createInstance" => Dict(
                "descriptionIri" => descriptionIri,
                "instanceName" => instanceName
            )
        )
    end

    function createRelationInstance(descriptionIri, instanceName)
        Dict(
            "createRelationInstance" => Dict(
                "descriptionIri" => descriptionIri,
                "instanceName" => instanceName
            )
        )
    end

    function createInstanceRef(descriptionIri, instanceIri, typeIri)
        Dict(
            "createInstanceRef" => Dict(
                "descriptionIri" => descriptionIri,
                "instanceIri" => instanceIri,
                "typeIri" => typeIri
            )
        )
    end

    function createRelationInstanceRef(descriptionIri, instanceIri, typeIri)
        Dict(
            "createRelationInstanceRef" => Dict(
                "descriptionIri" => descriptionIri,
                "instanceIri" => instanceIri,
                "typeIri" => typeIri
            )
        )
    end

    function addAssertion(descriptionIri, subjectIri, predicateIri, object)
        Dict(
            "addAssertion" => Dict(
                "descriptionIri" => descriptionIri,
                "subjectIri" => subjectIri,
                "predicateIri" => predicateIri,
                "object" => object
            )
        )
    end

    function updateAssertion(descriptionIri, subjectIri, predicateIri, object)
        Dict(
            "updateAssertion" => Dict(
                "descriptionIri" => descriptionIri,
                "subjectIri" => subjectIri,
                "predicateIri" => predicateIri,
                "object" => object
            )
        )
    end

    function removeAssertion(descriptionIri, subjectIri, predicateIri, object)
        Dict(
            "removeAssertion" => Dict(
                "descriptionIri" => descriptionIri,
                "subjectIri" => subjectIri,
                "predicateIri" => predicateIri,
                "object" => object
            )
        )
    end

    function addImport(importingIri, importedIri)
        Dict(
            "addImport" => Dict(
                "importingIri" => importingIri,
                "importedIri" => importedIri
            )
        )
    end

    function removeImport(importingIri, importedIri)
        Dict(
            "removeImport" => Dict(
                "importingIri" => importingIri,
                "importedIri" => importedIri
            )
        )
    end

    function addAnnotation(ontologyIri, subjectIri, predicateIri, object)
        Dict(
            "addAnnotation" => Dict(
                "ontologyIri" => ontologyIri,
                "subjectIri" => subjectIri,
                "predicateIri" => predicateIri,
                "object" => object
            )
        )
    end

    function updateAnnotation(ontologyIri, subjectIri, predicateIri, object)
        Dict(
            "updateAnnotation" => Dict(
                "ontologyIri" => ontologyIri,
                "subjectIri" => subjectIri,
                "predicateIri" => predicateIri,
                "object" => object
            )
        )
    end

    function removeAnnotation(ontologyIri, subjectIri, predicateIri, object)
        Dict(
            "removeAnnotation" => Dict(
                "ontologyIri" => ontologyIri,
                "subjectIri" => subjectIri,
                "predicateIri" => predicateIri,
                "object" => object
            )
        )
    end

    function deleteMemberCascade(ontologyIri, memberIri)
        Dict(
            "deleteMemberCascade" => Dict(
                "ontologyIri" => ontologyIri,
                "memberIri" => memberIri
            )
        )
    end

    function deleteMemberRef(ontologyIri, memberIri, typeIri)
        Dict(
            "deleteMemberRef" => Dict(
                "ontologyIri" => ontologyIri,
                "memberIri" => memberIri,
                "typeIri" => typeIri
            )
        )
    end

    function deleteOntology(ontologyIri)
        Dict(
            "deleteOntology" => Dict(
                "ontologyIri" => ontologyIri
            )
        )
    end

    function createOntology(ontologyKind, ontologyNamespace, ontologyPrefix, targetFolder)
        Dict(
            "createOntology" => Dict(
                "ontologyKind" => ontologyKind,
                "ontologyNamespace" => ontologyNamespace,
                "ontologyPrefix" => ontologyPrefix,
                "targetFolder" => targetFolder
            )
        )
    end

    #
    #
    # HTTP operations
    #
    #

    function is_alive(server)
        resp = HTTP.get("$server/health")
        return resp.status == 200
    end

    function update(server, operations, defer_diagnostics=false)
        body = Dict("operations" => operations, "deferDiagnostics" => defer_diagnostics)
        resp = HTTP.post("$server/v0/update", headers=Dict("Content-Type" => "application/json"), body=JSON3.write(body))
        return resp.status == 200
    end

end
