%Blackjack
choose= menu('Do you wanna play blackjack ?','Yes','No');
money= input('How much money do you have ? (in $)');
while choose==1 && money>0
bet =input('How much money are you willing to bet ? (in $)');
while bet>money || bet==0
    disp('Invalid amount');
    bet =input('How much money are you willing to bet ? (in $)');
end
load CardDeck;
points=0;
x=0;
choice=1;
aces=0;
dealerace=0;
dealer_points =0;
Deck= RedDeck;
hand=[];
dealer_hand=[];
Deck_values=[11 2:10 10 10 10 11 2:10 10 10 10 11 2:10 10 10 10 11 2:10 10 10 10];
Shuffled_deck= randperm(52);
card= Shuffled_deck(1);
hand= [hand Shuffled_deck(1)];
subplot(1,2,1);imshow([RedDeck{hand}]);
if card==1 || card==14 || card==27 || card==40
    aces= aces+1;
    ace_choice= menu('You have an ace ! What value do you want it to be ?', '1', '11');
    if ace_choice==1
        points= points+1;
    else
        points=points+11;
    end
else
    points= points + Deck_values(card);
end
Shuffled_deck= randperm(52);
card= Shuffled_deck(1);
hand= [hand Shuffled_deck(1)];
subplot(1,2,1);imshow([RedDeck{hand}]);
if card==1 || card==14 || card==27 || card==40
    aces= aces+1;
    ace_choice= menu('You have an ace ! What value do you want it to be ?', '1', '11');
    if ace_choice==1
        points= points+1;
    else
        points=points+11;
    end
else
    points= points + Deck_values(card);
end
subplot(1,2,1);imshow([RedDeck{hand}]);
fprintf('Your points are %i\n',points);
if points==21
    fprintf('Congrats ! You have a Blackjack\n');
end
while points>21 && aces>0
    points = points-10;
    fprintf('Your points are %i\n',points);
end
while points <=21 && choice==1
    if points<21
    choice= menu('Do you want to hit or stay ?', 'Hit !', 'Stay');
    elseif points==21
    choice=2;
    end
    switch choice
       case 1
         Shuffled_deck= randperm(52);
         card= Shuffled_deck(1);
         hand= [hand card];
         subplot(1,2,1);imshow([RedDeck{hand}]);
         if card==1 || card==14 || card==27 || card==40
             aces=aces+1;
             ace_choice= menu('You have an ace ! What value do you want it to be ?', '1', '11');
         if ace_choice==1
             points= points+1;
         else
             points=points+11;
         end
         else
         points= points + Deck_values(card);
         end
         fprintf('Your points are %i\n',points);
         if points>21 && aces>0
            aces= aces-1;
            points = points-10;
            fprintf('Your points are %i\n',points);
         end
        if points==21
            fprintf('Congrats ! You have a Blackjack\n');
        elseif points>21
            break;
        end
        case 2
            dealer_points =0;
            Shuffled_deck =randperm(52);
            dealer_card =Shuffled_deck(1);
            dealer_hand =[dealer_hand dealer_card];
            dealer_points =dealer_points+Deck_values(dealer_card);
            card = Shuffled_deck(1);
            if card==1 || card==14 || card==27 || card==40
                dealerace= dealerace+1;
            end
            Shuffled_deck =randperm(52);
            dealer_card =Shuffled_deck(1);
            dealer_hand =[dealer_hand dealer_card];
            card = Shuffled_deck(1);
            if card==1 || card==14 || card==27 || card==40
                dealerace= dealerace+1;
            end            
            dealer_points =dealer_points+Deck_values(dealer_card);
            while dealerace>0 && dealer_points>21
                dealerace= dealerace-1;
                dealer_points= dealer_points-10;
            end
            while dealer_points<17 && dealer_points<points
            Shuffled_deck =randperm(52);
            dealer_card =Shuffled_deck(1);
            dealer_hand =[dealer_hand dealer_card];
            card = Shuffled_deck(1);
            if card==1 || card==14 || card==27 || card==40
                dealerace= dealerace+1;
                disp('lol');
            end            
            dealer_points =dealer_points+Deck_values(dealer_card);
            while dealerace>1 && dealer_points>21
                dealer_points= dealer_points-10;
            end            
            end
    end
end;
if dealer_points<=21 && points<=21
    if dealer_points>=points
    disp('Dealers hand');
    subplot(1,2,2);imshow([RedDeck{dealer_hand}]);
    fprintf('Points for dealer are %i\n',dealer_points);
    disp('Sorry, you lost.');
    money= money-bet;
    fprintf('Your balance is %i $\n',money);
    elseif dealer_points<points
    disp('Dealers hand');
    subplot(1,2,2);imshow([RedDeck{dealer_hand}]);
    fprintf('Points for dealer are %i\n',dealer_points);
    disp('Congrats ! You win !!!');   
    money= money+bet;
    fprintf('Your balance is %i $\n',money);    
    end
elseif dealer_points>21 && points<21
    disp('Dealers hand');
    subplot(1,2,2);imshow([RedDeck{dealer_hand}]);
    fprintf('Points for dealer are %i\n',dealer_points);
    disp('Congrats ! You win !!!');
    money= money+bet;
    fprintf('Your balance is %i $\n',money);    
elseif points>21 
    disp('Sorry, you lost.');
    money= money-bet;
    fprintf('Your balance is %i $\n',money);    
end
if money==0
    disp('Your balance is 0 $');
    choose= menu('Do you wanna play again ?','Yes','No');
    if choose==1
        money=input('Enter how much money are you willing to spend:');
    end
else
    choose= menu('Do you wanna play again ?','Yes','No');
end
clc;
close;
end 