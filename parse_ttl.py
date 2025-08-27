from rdflib import Graph, Namespace, URIRef, RDF, RDFS
import re
import json
# Load graph
g = Graph()
g.parse("feux-pales.ttl", format="turtle")

# Define namespaces
DISPLAY = Namespace("https://w3id.org/display#")
EXHIB = Namespace("https://ouvroir.umontreal.ca/data/")

exhibits = dict()

# Iterate through all subjects
for subj in set(g.subjects()):
    subj_str = str(subj)

    # keep only URIs from the exhib namespace
    if subj_str.startswith(str(EXHIB)):
        # extract local name (e.g. "space0000")
        local_name = re.search(r'([^/#]+)$', subj_str).group(1)
        label = g.value(subj, RDFS.label)
        exh = {'id': local_name, 'label': label}
        template_exhibit = f"""The {local_name} is here. The description of the {local_name} is "". Understand "{label}" as the {local_name}. The {local_name} is fixed in place."""
        exh['template'] = template_exhibit
        if re.search('exhibit', local_name):
            lies_on = g.value(subj, DISPLAY.liesOn)
            if lies_on:
                exh['liesOn'] =  re.search(r'([^/#]+)$', lies_on).group(1)
                exh['template'] = template_exhibit + f"""The {local_name} is on the {exh.get('liesON', '')}"""
                 
        if re.search('(display|space)', local_name) :          
            contains = list(g.objects(subj, DISPLAY.containsExhibit))
            if contains:
                exh['containsExhibit'] = []
                for c in contains:
                    contained_exhib = re.search("([^/]+$)", c).group(1)
                    exh['containsExhibit'].append(contained_exhib)
                    exh['template'] = ''
                    # print(f"  containsExhibit → {contained_exhib} {exhibits.get(contained_exhib, '')}")
        if re.search('element', local_name) :
            contains = list(g.objects(subj, DISPLAY.contains))
            if contains:
                exh['contains'] = []
                for c in contains:
                    contained_exhib = re.search("([^/]+$)", c).group(1)
                    exh['contains'].append(contained_exhib)
                template_container = f"""The {local_name} is a closed container. {'the '.join(exh['contains'])} are in {local_name}."""
                exh['template'] = template_container
        exhibits[local_name] = exh
sorted_dict = dict(sorted(exhibits.items()))
print(sorted_dict)
filtered_dict = [exh['template'] for exh in sorted_dict.values()]
with open('template.txt', 'w', encoding='utf-8') as g:

    for exh in filtered_dict:
        g.write(exh+'\n')
with open('data.json', 'w', encoding='utf-8') as f:
    json.dump(sorted_dict,f,  ensure_ascii=False, indent=2)
    
