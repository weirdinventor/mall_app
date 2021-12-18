
import random
import numpy as np

#-------------------------Fitness-----------------------
# gets the total cost 
def fitness(chromosome):
    global ds
    global prices
    fitness_val=0
    for i in range(len(chromosome)):
        if(chromosome[i]==1):
            fitness_val+=prices[i]
            #print(get_price(i))
    return(fitness_val)

#-------------------------individual  in population-----------------------
class Individual(object):
    '''
    Class representing individual in population
    '''
    def __init__(self, chromosome, fitness, generation):
        self.chromosome = chromosome
        self.fitness = fitness
        self.generation=generation

    def __repr__(self):
        return '{' + str(self.chromosome) + ', ' + str(self.fitness)  +','+ str(self.generation) + '}'

#-------------------------create chromosome-----------------------
def create_chromosome():
    chromosome=[]
    for i in range(1000) :
        x=random.random()
        if(x<0.5):
            chromosome.append(0)
        else:
            chromosome.append(1)

    fitness_value = fitness(chromosome)
    generation=1
    objet=Individual(chromosome,fitness_value,generation)

    return objet

#----------------Initialize Population ------------------
def Init_population():
    global nbp
    population=[]
    
    for i in range(nbp):
        population.append(create_chromosome())
    
    return population 

#-------------------------Crossover Function(single_point)----------------------
def crossover(Parent1, Parent2):
    l=Parent1
    q=Parent2
    c1=[]
    c2=[]
    # generating the random number to perform crossover
    k = random.randint(1, int(len(Parent1)/2))
    #print(k)
    #print("Crossover point :", k)
  
    # interchanging the genes
    for i in range(k):
        c2.append(q[i])
        c1.append(l[i])
    for i in range(k, len(Parent1)):
        c1.append(q[i])
        c2.append(l[i])
    
    #print(l)
    #print(q, "\n\n")
    return (list(c1), list(c2))
  
#-------------------------Mutation Function(single_point)----------------------
def mutation(chromosome):
    i=random.randint(0,998)
    #print(i)
    if(chromosome[i]==1):
        chromosome[i]=0
    else:
        chromosome[i]=1
    return(chromosome)

#-------------------------best chromosomes-----------------------
def best_chromosomes(population,nbparents):
    best_parents=[]
    print("avant//////",population)
    population.sort(key=lambda x: x.fitness,reverse=True)
    #sorted(population, key=lambda x: getattr(x, 'fitness'), reverse=True)
    print("apres////",population)
    for i in range(nbparents):
        best_parents.append(population[i])
    return best_parents

#-----------------------update GBest--------------------------
def updateGBest(Gbest,population,budget):
    for element in population:
            #print('looking for new Gbest')
            if((Gbest.fitness<element.fitness) and (element.fitness<=budget)):
                Gbest.fitness=element.fitness
                Gbest.chromosome=element.chromosome
                Gbest.generation=element.generation

                #break

#-------------------------Choosing parents-----------------------
def chooseParents(population,i,nbparents):
    best_match=random.randint(0,nbparents-1)
    while(i==best_match):
        best_match=random.randint(0,nbparents-1)
    return (best_match)
    
    '''for j in range(0,nbparents):
        if i!=j :
            index_bids=[]
            for k in range(0,len(population[j].chromosome)):
                if(population[j].chromosome[k]==1):
                    index_bids.append(k)

            temp=len(set(population[i].chromosome).intersection(index_bids))
            if temp<nb_conflit:
                best_match=j
                nb_conflit=temp
                if nb_conflit== 0 :
                    break
    
    return population[best_match]'''

#-------------------------show 1s-----------------------
def showbits(chromosome):# Return the Indexes i
    indexes=[]
    for i in range(len(chromosome)):
        if chromosome[i]==1:
            indexes.append(i)
    
    return indexes
#-------------------------GA Updating generations-----------------------
def UpdatePopulation(Gbest,population,nbp,nbg,budget):
    generation = 1
    
    updateGBest(Gbest,population,budget)
    while(generation < nbgenerations+1):
        print(str(generation),":",Gbest.chromosome,":",fitness(Gbest.chromosome))
        total_children=[]
        new_population=[]
        best_parents=[]
        children=[]
        for i in range(nbparents):
            #selectioner les parents 
            parent1=population[i]
            parent2_index=chooseParents(population,i,nbp)
            parent2=population[parent2_index]
            #Appliquer le crossover
            children=crossover(parent1.chromosome,parent2.chromosome)
            
            #Appliquer la mutation au 1er offspring
            child1=mutation(children[0])
            ch1=Individual(child1,fitness(child1),generation)
            total_children.append(ch1)

        best_parents=best_chromosomes(population,nbparents)
        reste=nbp-len(total_children)
        new_population=new_population+total_children

        for i in range(reste):
            new_population.append(best_parents[i])

        new_population.sort(key=lambda x: x.fitness,reverse=True)

        population=new_population

        generation=generation+1

        updateGBest(Gbest,population,budget)

    #print('GBest chromosome : ',Gbest.chromosome)
    print('--------------------------------------------------------------')
    print('best valid offer at generation:',generation-1,':')
    print('fitness = ',Gbest.fitness,'generation =',Gbest.generation)
    print(showbits(Gbest.chromosome))

#------------------------------MAIN-------------------------------

import time
budget=6521377 #max atteint par la totalité des items qui peut etre:10461518 
generation=1
nbgenerations=50
nbparents=175
nbp=200
nbligne=1000
population=[]
prices=[]
ds=[]
total_prices=0
for i in range(1000):
    ds.append(i)
    val=random.randint(500,20000)
    prices.append(val)
    total_prices=total_prices+val

individu1=create_chromosome()
population=Init_population()
cross1=list()
cross2=list()
p1=[1,0,1,0,0,0,1]
p2=[1,1,1,0,1,0,1]
cross1,cross2=crossover(p1,p2)
mutated=[]
#mutated=mutation(cross1)
best_parents=[]
best_parents=best_chromosomes(population,nbp)
#generate the Gbest
Gbest_list=[0]*1000
Gbest=Individual(Gbest_list,fitness(Gbest_list),1)

#start_time = time.time()
pop2=[]
pop2.append(p1)
pop2.append(p2)
pop2.append(cross1)
pop2.append(cross2)

'''for element in population:
        #print('looking for new Gbest')
        print(element.fitness)
            
        if(element.fitness)<+budget:
                Gbest=element
print(Gbest)'''
#########################################################################
UpdatePopulation(Gbest,population,nbp,nbgenerations,budget)
#print("\ntotal possibles:",total_prices)
#print(prices)
#end_time=time.time()
#print('execution time:',end_time - start_time)
#########################################################################


