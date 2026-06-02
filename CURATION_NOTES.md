# Curation notes — known gaps and bad entries

Running log of data-availability gaps and known-bad curated entries, so they
aren't mistaken for complete/correct data. Surfaced during the jetscape-analysis
observable-encoding migration (see `JETSCAPE-analysis/MIGRATION_NOTES.md`).

## 5020 (Pb-Pb 5.02 TeV)

### Missing / not yet curated (`hepdata: N/A` in `config/STAT_5020.yaml`)

These observables have **no curated HEPData** here — not present under
`data/5020/...` and not registered in `hepdata_database.yaml`:

| Observable | Inspire | Note |
|---|---|---|
| `inclusive_jet/pt_small_R_atlas` | 2623088 | not curated |
| `inclusive_jet/rg_atlas` | 2512925 | not curated |
| `inclusive_jet/d12_atlas` | 2623088 | not curated; config marked `# TODO: Update` |
| `inclusive_jet/dR12_atlas` | 2909617 | not curated; config marked `# TODO: Update` |
| `dijet_trigger_jet/pt_pair_atlas` | 2811406 (arXiv 2407.18796) | not curated — see bad entry below |
| `dijet_trigger_jet/xj_atlas` | 2811406 (arXiv 2407.18796) | not curated — see bad entry below |
| `dijet_trigger_jet/yield_atlas` | 2811406 (arXiv 2407.18796) | not curated — see bad entry below |

### Known-bad entries (curated but WRONG — to delete/replace)

**`data/5020/dijet_trigger_jet/{pt_pair_atlas,xj_atlas,yield_atlas}/`** — each
contains a `HEPData-ins2165916-v1-yaml/` dir that is a **byte-identical copy of
the CMS `ins2165916` payload** (CMS HIN-21-002, dijet v₂/v₃/v₄). That is the
wrong measurement: these three slots are meant to hold the **ATLAS** dijet
radius-dependence measurement (R_AA^pair, x_j, dijet yield), inspire **2811406**
(arXiv 2407.18796), which is **not yet curated**.

Action: delete these three stub dirs (and their `hepdata_database.yaml` entries)
and re-curate from the real ATLAS 2811406 record when available. The config in
jetscape-analysis no longer references them (its `inspire_hep` now points at
2811406 with `hepdata: N/A`).

Only `dijet_trigger_jet/v2_cms/HEPData-ins2165916-v1-yaml/` legitimately matches
`ins2165916`.

### Curated and correct, but unused (context — not a curation gap)

These have correct curated data; they are disabled in the analysis only because
the analyzer code isn't available yet (not a curation issue):
- `dijet_trigger_jet/v2_cms` — ins2165916 (CMS dijet v₂/v₃/v₄).
- `inclusive_jet/eec_cms` — ins2904406-v2.
