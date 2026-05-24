using GLib;

public struct Family {
    public string id;
    public string renderer;
    public string tranche;
    public string context_key;
    public string context_value;

    public Family(string id, string renderer, string tranche, string context_key, string context_value) {
        this.id = id;
        this.renderer = renderer;
        this.tranche = tranche;
        this.context_key = context_key;
        this.context_value = context_value;
    }
}

Family[] families() {
    return {
    Family("code_analyzer", "classic-six.code_analyzer", "classic-six", "analysisFocus", "gobject-syntax-audit"),
    Family("data_processing", "classic-six.data_processing", "classic-six", "dataWindow", "array-stream-reconciliation"),
    Family("jargon", "classic-six.jargon", "classic-six", "languagePolicy", "vala-glossary"),
    Family("metrics", "classic-six.metrics", "classic-six", "signalBlend", "glib-runtime-latency"),
    Family("network_activity", "classic-six.network_activity", "classic-six", "transportMix", "socket-http-sse"),
    Family("system_monitoring", "classic-six.system_monitoring", "classic-six", "telemetryScope", "vala-glib-runtime-host"),
    Family("agent_workflows", "modern-core.agent_workflows", "modern-core", "coordinationMode", "object-dispatch-handshake"),
    Family("platform_engineering", "modern-core.platform_engineering", "modern-core", "platformSurface", "vala-native-validation-lane"),
    Family("observability_ai_runtime", "modern-core.observability_ai_runtime", "modern-core", "runtimeSignals", "logs-metrics-provider-boundary"),
    Family("delivery_preview_ops", "modern-core.delivery_preview_ops", "modern-core", "deliveryGuardrail", "compiled-preview-checkpoints"),
    Family("supply_chain_security", "modern-core.supply_chain_security", "modern-core", "supplyChainPosture", "source-binary-attestation"),
    Family("ai_inference_ops", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("evaluation_and_guardrails", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("knowledge_retrieval", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("edge_client_runtime", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("identity_and_trust", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("aibom_provenance", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("agent_boundary_security", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("embedded_agentic_pipeline", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("data_governance_compliance", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("finops_capacity", "fallback.ai_governance", "fallback-ai_governance", "fallbackFamily", "ai_governance"),
    Family("blockchain_protocol_ops", "fallback.security_blockchain", "fallback-security_blockchain", "fallbackFamily", "security_blockchain"),
    Family("cross_chain_interop", "fallback.security_blockchain", "fallback-security_blockchain", "fallbackFamily", "security_blockchain"),
    Family("proof_and_sequencer_ops", "fallback.security_blockchain", "fallback-security_blockchain", "fallbackFamily", "security_blockchain"),
    Family("hybrid_runtime_ops", "fallback.overlay_quantum", "fallback-overlay_quantum", "fallbackFamily", "overlay_quantum"),
    Family("capacity_cost_controller", "fallback.overlay_quantum", "fallback-overlay_quantum", "fallbackFamily", "overlay_quantum"),
    Family("batch_execution_tuner", "fallback.overlay_quantum", "fallback-overlay_quantum", "fallbackFamily", "overlay_quantum"),
    Family("compiler_maintainer", "fallback.overlay_quantum", "fallback-overlay_quantum", "fallbackFamily", "overlay_quantum"),
    Family("interop_adapter_engineer", "fallback.overlay_quantum", "fallback-overlay_quantum", "fallbackFamily", "overlay_quantum"),
    Family("preflight_capacity_planner", "fallback.overlay_quantum", "fallback-overlay_quantum", "fallbackFamily", "overlay_quantum"),
    Family("simulator_performance_engineer", "fallback.overlay_quantum", "fallback-overlay_quantum", "fallbackFamily", "overlay_quantum"),
    Family("fhir_profile_generator", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("smart_launch_oauth", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("bulk_fhir_population_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("hl7v2_feed_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("clinical_workflow_events", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("dicomweb_imaging_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("openehr_semantic_record_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("device_telemetry_clinical", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("emr_vendor_adapter", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("ocpp_chargepoint_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("ocpi_roaming_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("mcp_a2a_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("streaming_bus_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol"),
    Family("service_mesh_rpc_ops", "fallback.health_protocol", "fallback-health_protocol", "fallbackFamily", "health_protocol")
    };
}

string registry_id(string value) {
    return value.replace("_", "-");
}

string normalize_family(string value) {
    return value.down().replace("-", "_");
}

bool find_family(string value, out Family found) {
    string normalized = normalize_family(value);
    foreach (Family family in families()) {
        if (family.id == normalized) {
            found = family;
            return true;
        }
    }
    found = Family("", "", "", "", "");
    return false;
}

uint32 deterministic_hash(string value) {
    uint32 hash = 2166136261U;
    for (int i = 0; i < value.length; i++) {
        hash = hash * 16777619U + (uint8) value[i];
    }
    return hash;
}

string pad2(uint32 value) {
    return value < 10 ? "0%u".printf(value) : "%u".printf(value);
}

string quoted_ids(string tranche, bool fallback) {
    StringBuilder builder = new StringBuilder();
    bool first = true;
    foreach (Family family in families()) {
        bool include = fallback ? (family.tranche != "classic-six" && family.tranche != "modern-core") : (family.tranche == tranche);
        if (!include) continue;
        if (!first) builder.append(",");
        builder.append("\"");
        builder.append(registry_id(family.id));
        builder.append("\"");
        first = false;
    }
    return builder.str;
}

void print_registry() {
    StringBuilder rows = new StringBuilder();
    bool first = true;
    foreach (Family family in families()) {
        if (!first) rows.append(",");
        rows.append("{\"id\":\""); rows.append(family.id);
        rows.append("\",\"registryId\":\""); rows.append(registry_id(family.id));
        rows.append("\",\"rendererKey\":\""); rows.append(family.renderer);
        rows.append("\",\"tranche\":\""); rows.append(family.tranche);
        rows.append("\"}");
        first = false;
    }
    stdout.printf("{\"outputFormats\":[\"text\",\"json\"],\"flags\":[\"list-values\",\"focus-family\",\"output-format\",\"seed\",\"experimental-provider\"],\"generatorFamilies\":[%s],\"classicSix\":[%s],\"modernCore\":[%s],\"fallbackFamilies\":[%s],\"implementationMode\":\"family-focus-deterministic\"}\n", rows.str, quoted_ids("classic-six", false), quoted_ids("modern-core", false), quoted_ids("", true));
}

void print_payload(Family family, string seed, string output_format) {
    uint32 hash = deterministic_hash(seed + "::" + family.id);
    uint32 seconds = hash % 86400U;
    uint32 hour = seconds / 3600U;
    uint32 minute = (seconds % 3600U) / 60U;
    uint32 second = seconds % 60U;
    uint32 sequence = 1000U + (hash % 9000U);
    string timestamp = "2026-01-01T" + pad2(hour) + ":" + pad2(minute) + ":" + pad2(second) + "Z";
    string fingerprint = registry_id(family.id) + "-" + hash.to_string("%08x");
    if (output_format == "json") {
        stdout.printf("{\"eventType\":\"stakeholder.generator.output\",\"sequence\":%u,\"family\":\"%s\",\"message\":\"Deterministic vala tranche for %s\",\"timestamp\":\"%s\",\"context\":{\"rendererKey\":\"%s\",\"%s\":\"%s\",\"seedFingerprint\":\"%s\",\"tranche\":\"%s\",\"valaProfile\":\"glib-compiled-struct-catalog\"},\"generationProvenance\":{\"sourceRepo\":\"vala-stakeholder\",\"baseline\":\"local-small-tranche-family-focus\",\"experimental\":false,\"adapterType\":\"static-struct-catalog\",\"promptVersion\":null},\"outputFormat\":\"json\"}\n", sequence, family.id, family.id, timestamp, family.renderer, family.context_key, family.context_value, fingerprint, family.tranche);
    } else {
        stdout.printf("family: %s\nrenderer: %s\ntranche: %s\nsequence: %u\ntimestamp: %s\nmessage: Deterministic vala tranche for %s\n", family.id, family.renderer, family.tranche, sequence, timestamp, family.id);
    }
}

int fail(string message) {
    stderr.printf("%s\n", message);
    return 2;
}

int fail_with(string message, string value) {
    stderr.printf("%s: %s\n", message, value);
    return 2;
}

int main(string[] args) {
    string focus_family = "";
    string seed = "default-seed";
    string output_format = "text";
    bool list_values = false;
    int i = 1;
    while (i < args.length) {
        string arg = args[i];
        if (arg == "--list-values") {
            list_values = true;
            i++;
        } else if (arg == "--focus-family") {
            if (i + 1 >= args.length) return fail("missing value for --focus-family");
            focus_family = args[i + 1];
            i += 2;
        } else if (arg == "--seed") {
            if (i + 1 >= args.length) return fail("missing value for --seed");
            seed = args[i + 1];
            i += 2;
        } else if (arg == "--output-format") {
            if (i + 1 >= args.length) return fail("missing value for --output-format");
            string candidate = args[i + 1];
            if (candidate != "text" && candidate != "json") return fail_with("invalid --output-format", candidate);
            output_format = candidate;
            i += 2;
        } else if (arg == "--experimental-provider") {
            if (i + 1 >= args.length) return fail("missing value for --experimental-provider");
            return fail_with("experimental provider is not enabled in the deterministic first tranche", args[i + 1]);
        } else {
            if (arg.has_prefix("--experimental-")) return fail("experimental flags require --experimental-provider");
            return fail_with("unknown argument", arg);
        }
    }
    if (list_values) {
        print_registry();
        return 0;
    }
    if (focus_family == "") return fail("focus-family is required and must be a known generator family");
    Family family;
    if (!find_family(focus_family, out family)) return fail_with("invalid --focus-family", focus_family);
    print_payload(family, seed, output_format);
    return 0;
}
